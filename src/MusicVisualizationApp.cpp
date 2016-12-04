//
//  MusicVisualization
//
//  Created by Nick Bartzokas
//

#include <regex>

#include "cinder/app/App.h"
#include "cinder/app/RendererGl.h"
#include "cinder/audio/Context.h"
#include "cinder/audio/MonitorNode.h"
#include "cinder/audio/Utilities.h"
#include "cinder/audio/Source.h"
#include "cinder/audio/SamplePlayerNode.h"
#include "cinder/Capture.h"
#include "cinder/gl/gl.h"
#include "cinder/Log.h"
#include "cinder/params/Params.h"
#include "cinder/Rand.h"
#include "cinder/Timeline.h"
#include "cinder/Utilities.h"

#include "CircleWaveform.h"
#include "Splat.h"

using namespace ci;
using namespace ci::app;
using namespace std;

static const int
numBins = 100,
padding = 0,
height = 20;

static const string
deltafieldDirectory = "shaders/DeltaFields/",
edgeDetectionVert = "shaders/edge_detection.vert",
edgeDetectionFrag = "shaders/edge_detection.frag",
deltafieldVert = "shaders/deltafield.vert",
deltafieldFrag = "shaders/deltafield.frag";

static bool
showParams = false,
showMouse = false,
showCameraEdges = false;

static std::vector<std::string> shaderNames;

class MusicVisualizationApp : public App {
    
public:
    
    // events
    void setup() override;
    void mouseMove( MouseEvent event ) override;
    void mouseDown( MouseEvent event ) override;
    void keyDown( KeyEvent event ) override;
    void update() override;
    void draw() override;
    void fileDrop( FileDropEvent event ) override;
    
    // setup
    void setupAudio();
    void setupAlphaBlendingFbos();
    void setupParams();
    void setupVisualElements();
    
    // draw
    void drawPastFramesWithAlphaFade();
    void drawCircleWaveform();
    void drawCameraEdges();
    void drawTextures();
    void drawSplats();
    void drawFrequencyBand();
    
    // audio
    audio::InputDeviceNodeRef mInputDeviceNode;
    audio::MonitorNodeRef mMonitorNode;
    audio::MonitorSpectralNodeRef mMonitorSpectralNode;
    vector<float> mMagSpectrum;
    audio::SourceFileRef mSourceFile;
    audio::BufferPlayerNodeRef mBufferPlayer;
    float mVolume = 0.0;
    float mVolumeSmoothed = 0.0;
    float mSmoothness = 0.5;
    bool playAudioFileAndCutMic(const fs::path filename);
    
    // shaders
    gl::GlslProgRef shader;
    string shaderName = "_";
    int whichShader = 0, lastShader = 0;
    ci::Anim<float> crossfade = 0.0;
    string vert, frag, text, textLast;
    void loadDeltaFields();
    void createShader();
    void previousShader();
    void nextShader();
    void randomShader();
    
    // alpha fade
    float fadeSpeed = 0.0001f;
    vector<gl::FboRef> pastFrames;
    int onScreen = 0, offScreen = 1;

    // params
    ci::params::InterfaceGlRef params;
    
    // circle
    CircleWaveformRef circleWaveform;
    vec2 circlePosition;
    float circleRadius = 500.0;
    
    // drag and drop images
    vector< pair<gl::TextureRef,vec2> > textures;
    bool addTextureAtPosition(const fs::path filename, vec2 pos);
    
    // click splats
    vector<Splat> splats;
    
    // camera capture
    CaptureRef			capture;
    gl::Texture2dRef	capturedTexture;
    gl::GlslProgRef     captureShader;
    // edge detection
    float edgeThreshold1 = 0.0, edgeThreshold2 = 1.0, edgeThreshold3 = 1.8;
    
    vec2 mousePos = vec2(0,0);
    
};

void MusicVisualizationApp::setup()
{
    hideCursor();

    app::setFullScreen(true);
    
    loadDeltaFields();
    setupAudio();
    setupAlphaBlendingFbos();
    setupParams();
    setupVisualElements();
    
    // Setup circle position
    circlePosition = getWindowCenter();
    
}

void MusicVisualizationApp::loadDeltaFields(){
    const std::regex glsltype( "(glsl)", std::regex::icase );
    cout << deltafieldDirectory << endl;
    cout << getAssetPath(deltafieldDirectory) << endl;
    for( fs::directory_iterator it( getAssetPath(deltafieldDirectory) ); it!=fs::directory_iterator(); ++it){
        if ( fs::is_regular_file(*it) && std::regex_search( it->path().extension().string(), glsltype ) ){
            shaderNames.push_back(it->path().stem().string());
        }
    }
}

void MusicVisualizationApp::setupAudio(){
    auto ctx = audio::Context::master();
    
    // The InputDeviceNode is platform-specific, so you create it using a special method on the Context:
    mInputDeviceNode = ctx->createInputDeviceNode();
    
    mMonitorNode = ctx->makeNode( new audio::MonitorNode( audio::MonitorNode::Format().windowSize( 1024 ) ) );
    mMonitorSpectralNode = ctx->makeNode( new audio::MonitorSpectralNode( audio::MonitorSpectralNode::Format().fftSize( 2048 ).windowSize( 1024 ) ) );
    
    mInputDeviceNode
    >> mMonitorNode
    >> mMonitorSpectralNode
    ;
    
    // InputDeviceNode (and all InputNode subclasses) need to be enabled()'s to process audio. So does the Context:
    mInputDeviceNode->enable();
    ctx->enable();
    
    // ready buffer player
    mBufferPlayer = ctx->makeNode( new audio::BufferPlayerNode() );
    
    getWindow()->setTitle( mInputDeviceNode->getDevice()->getName() );
}

// Setup buffers with alpha fading
void MusicVisualizationApp::setupAlphaBlendingFbos(){
    
    gl::Fbo::Format msaaFormat;
    msaaFormat.setSamples( 8 );
    
    pastFrames = {
        gl::Fbo::create( getWindowWidth(), getWindowHeight(), msaaFormat ),
        gl::Fbo::create( getWindowWidth(), getWindowHeight(), msaaFormat )
    };
    
    // clear buffers
    for (auto &pastFrame: pastFrames){
        ci::gl::ScopedFramebuffer fbo( pastFrame );
        gl::clear(  ColorA( 0, 0, 0, 1 ) );
    }
    
}

void MusicVisualizationApp::setupParams(){
    params = params::InterfaceGl::create( getWindow(), "App parameters", toPixels( ivec2( 200, 300 ) ) );
    params->addParam( "Shader name", shaderNames, &whichShader);
    params->addButton( "Reload shader", bind(&MusicVisualizationApp::createShader, this) );
    params->addParam( "Circle Radius", &circleRadius );
    params->addParam( "Fade Speed", &fadeSpeed ).min(0).max(1).step(0.0001f);
    params->addParam( "edgeThreshold1", &edgeThreshold1 );
    params->addParam( "edgeThreshold2", &edgeThreshold2 );
    params->addParam( "edgeThreshold3", &edgeThreshold3 );
}

void MusicVisualizationApp::setupVisualElements()
{
    
    // delta field shader setup
    whichShader = 0;
    createShader();
    
    // circle
    circleWaveform = CircleWaveform::create( mMonitorNode->getWindowSize(), getWindowCenter() );
    
    // camera capture
    try {
        capture = Capture::create( 320, 240 );
        capture->start();
    }
    catch( CaptureExc &exc ) {
        CI_LOG_EXCEPTION( "failed to initialize the Capture: ", exc );
    }
    
    // camera capture edge detection
    captureShader = ci::gl::GlslProg::create( gl::GlslProg::Format()
                                             .vertex( loadAsset( edgeDetectionVert ) )
                                             .fragment( loadAsset( edgeDetectionFrag ) )
                                             );
}

void MusicVisualizationApp::createShader()
{
    try{
        cout << shaderNames[whichShader] << endl;
        
        crossfade = 0.0;
        text = loadString( loadAsset( deltafieldDirectory + shaderNames[whichShader]+".glsl"  ) );
        textLast = loadString( loadAsset( deltafieldDirectory + shaderNames[lastShader]+".glsl"  ) );
        lastShader = whichShader;
        
        vert = loadString( loadAsset( deltafieldVert ) );
        frag = loadString( loadAsset( deltafieldFrag ) );
        
        frag.replace( frag.find("//_1"), 4 ,textLast);
        frag.replace( frag.find("//_2"), 4 ,text);
        
        shader = ci::gl::GlslProg::create(vert,frag);
        
        ci::app::timeline()
        .apply(&crossfade, 1.0f /* end value */, 3.0f /* duration */, ci::EaseOutQuad() )
        .finishFn([&](){
            crossfade = 0.0;
            frag = loadString( loadAsset( deltafieldFrag ) );
            frag.replace( frag.find("//_1"), 4 ,text);
            shader = ci::gl::GlslProg::create(vert,frag);
        });
        
    }catch(std::exception &exc ) {
        CI_LOG_E( "Uncaught exception, type: " << System::demangleTypeName( typeid( exc ).name() ) << ", what: " << exc.what() );
    }catch(...){
        cout << "ERROR" << endl;
    }
}

void MusicVisualizationApp::previousShader()
{
    whichShader = whichShader - 1 < 0 ? shaderNames.size()-1 : whichShader - 1;
    createShader();
}

void MusicVisualizationApp::nextShader()
{
    whichShader = whichShader + 1 >= shaderNames.size() ? 0 : whichShader + 1;
    createShader();
}

void MusicVisualizationApp::randomShader()
{
    whichShader = randInt( shaderNames.size()-1 );
    createShader();
}

void MusicVisualizationApp::mouseMove( MouseEvent event )
{
    mousePos = vec2( (float)event.getPos().x/getWindowWidth(), (float)event.getPos().y/getWindowHeight() );
}

void MusicVisualizationApp::mouseDown( MouseEvent event )
{
    splats.push_back( Splat(event.getPos()) );
}

void MusicVisualizationApp::keyDown( KeyEvent event )
{
    switch (event.getChar()) {
        case 's': showParams = !showParams; break;
        case 'm':
            showMouse = !showMouse;
            if (showMouse) showCursor();
            else hideCursor();
            break;
        case 'r': randomShader(); break;
        default: break;
    }
    switch (event.getCode()) {
        case KeyEvent::KEY_LEFT: previousShader(); break;
        case KeyEvent::KEY_RIGHT: nextShader(); break;
        default: break;
    }
}

void MusicVisualizationApp::update()
{
    mVolume = mMonitorNode->getVolume();
    mVolumeSmoothed = (1.0 - mSmoothness) * mVolumeSmoothed + mSmoothness * mVolume;
    mMagSpectrum = mMonitorSpectralNode->getMagSpectrum();
    
    // ping pong
    onScreen = 1 - onScreen;
    offScreen = 1 - offScreen;
    
    if( capture && capture->checkNewFrame() ) {
        capturedTexture = gl::Texture2d::create( *capture->getSurface() );
    }
    
}

void MusicVisualizationApp::draw()
{
    
    gl::clear(  Color( 0, 0, 0 ) );
    
    // draw to screen
    gl::draw( pastFrames[onScreen]->getColorTexture() );
    
    // draw to buffer
    {
        ci::gl::ScopedFramebuffer fbo( pastFrames[offScreen] );
        gl::clear(  ColorA( 0, 0, 0, 1 ) );

        drawPastFramesWithAlphaFade();
        drawCircleWaveform();
        if (showCameraEdges) drawCameraEdges();
        drawTextures();
        drawSplats();
        drawFrequencyBand();
    }
    
    if (showParams) params->draw();
    
}

// draw past frames, faded
void MusicVisualizationApp::drawPastFramesWithAlphaFade()
{
    
    ci::gl::ScopedGlslProg glslScope( shader );
    ci::gl::ScopedTextureBind tex(  pastFrames[onScreen]->getColorTexture(), 0 );
    
    shader->uniform( "uTex0", 0 );
    shader->uniform( "fadeSpeed", fadeSpeed );
    shader->uniform( "crossfade", crossfade );
    shader->uniform( "time", (float)ci::app::getElapsedSeconds() );
    
    ci::gl::drawSolidRect( pastFrames[onScreen]->getBounds() );
    
}

// draw circle waveform
void MusicVisualizationApp::drawCircleWaveform()
{
    circleWaveform->setRadius(circleRadius);
    circleWaveform->draw( mMonitorNode->getBuffer(), mVolume );
}

// draw camera input
void MusicVisualizationApp::drawCameraEdges()
{
    if( capturedTexture ){
        gl::ScopedGlslProg shaderScp( captureShader );
        gl::ScopedTextureBind texBindScp( capturedTexture );
        captureShader->uniform( "threshold1", edgeThreshold1 );
        captureShader->uniform( "threshold2", edgeThreshold2 );
        captureShader->uniform( "threshold3", edgeThreshold3 );
        captureShader->uniform( "volume", mVolume );
        gl::drawSolidRect( getWindowBounds() );
    }
}

// draw textures
void MusicVisualizationApp::drawTextures()
{
    
    for (auto &texPos : textures){
        auto tex = texPos.first;
        auto pos = texPos.second;
        Rectf r = Rectf( pos.x, pos.y, pos.x + tex->getWidth(), pos.y+tex->getHeight() );
        gl::draw( tex, r );
    }
    
}

// draw splats
void MusicVisualizationApp::drawSplats()
{
    
    for (auto &splat : splats){ splat.draw(); }
    splats.clear();
    
}

// Draw colored frequency band around the border of the screen
void MusicVisualizationApp::drawFrequencyBand()
{
    
    for (int i=0; i<numBins; i++){
        
        // derive colors from spectrum magnitudes
        float m = mMagSpectrum[i];
        m = audio::linearToDecibel( m ) / 100.0;
        m = m * m;
        
        float hue = (float)i / (float)numBins;
        float val = m;
        gl::ScopedColor color( hsvToRgb(vec3( hue, .5, val )) );
        
        float
        x = padding,
        y = getWindowHeight() * (numBins - i) / numBins,
        w = height,
        h = ( getWindowHeight() / numBins ) - 2 * padding;
        gl::drawSolidRect( Rectf(x,y,x+w,y+h) );
        
        x = getWindowWidth() - height - 2 * padding;
        gl::drawSolidRect( Rectf(x,y,x+w,y+h) );
        
        x = getWindowWidth() * (numBins - i) / numBins;
        y = padding;
        w = ( getWindowWidth() / numBins ) - 2 * padding;
        h = height;
        gl::drawSolidRect( Rectf(x,y,x+w,y+h) );
        
        y = getWindowHeight() - height - 2 * padding;
        gl::drawSolidRect( Rectf(x,y,x+w,y+h) );
        
    }
    
}

void MusicVisualizationApp::fileDrop( FileDropEvent event )
{
    
    const fs::path filename = event.getFile( 0 );
    const std::regex imagetype( "(jpg|jpeg|png|gif|bmp)", std::regex::icase );
    const std::regex audiotype( "(mp3)", std::regex::icase );

    if ( std::regex_search( filename.extension().string(), imagetype ) ){
        addTextureAtPosition(filename, event.getPos());
    }else if ( std::regex_search( filename.extension().string(), audiotype ) ){
        playAudioFileAndCutMic(filename);
    }
    
}

// Add an image file at position
bool MusicVisualizationApp::addTextureAtPosition(const fs::path filename, vec2 pos)
{
    
    try {
        textures.push_back( make_pair( gl::Texture::create( loadImage( filename ) ), pos ) );
        return true;
    }catch( Exception &exc ) {
        CI_LOG_EXCEPTION( "failed to load image file: " << filename, exc );
        return false;
    }
    
}

// Turn off microphone and play the audio file
bool MusicVisualizationApp::playAudioFileAndCutMic(const fs::path filename)
{
    
    auto ctx = audio::Context::master();
    mBufferPlayer->disconnectAll();
    mInputDeviceNode->disconnectAll();
    
    try {
        mSourceFile = audio::load( loadFile( filename ) , ctx->getSampleRate() );
        mBufferPlayer->loadBuffer( mSourceFile );
        mBufferPlayer >> mMonitorNode >> ctx->getOutput();
        mBufferPlayer->start();
        return true;
    }catch( Exception &exc ) {
        CI_LOG_EXCEPTION( "failed to load audio file: " << filename, exc );
        mBufferPlayer->disconnect(mMonitorNode);
        mMonitorNode->disconnect(ctx->getOutput());
        mInputDeviceNode->connect(mMonitorNode);
        return false;
    }
    
}

CINDER_APP( MusicVisualizationApp, RendererGl(RendererGl::Options().msaa(8) ) )
