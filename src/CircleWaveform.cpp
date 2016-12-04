//
//  CircleWaveform.cpp
//  MusicVisualization
//
//  Created by NBartzokas on 10/8/16.
//
//

#include <stdio.h>
#include "CircleWaveform.h"

#define PI 3.14159265358979323846
#define TWO_PI 6.28318530717958647693

using namespace ci;
using namespace ci::app;

CircleWaveform::CircleWaveform(size_t sz, ci::vec2 l){
    location_ = l;
    waveformShader_ = gl::GlslProg::create( gl::GlslProg::Format()
                                          .vertex( loadAsset( "shaders/waveform.vert" ) )
                                          .fragment( loadAsset( "shaders/waveform.frag" ) )
                                          .geometry( loadAsset( "shaders/waveform.geom" ) )
                                          );
    batch_ = gl::VertBatch::create();
}

void CircleWaveform::update(){
}

void CircleWaveform::draw(const ci::audio::Buffer& audioBuffer, float volume){
    
    gl::ScopedBlendAlpha alpha;
    gl::ScopedColor color( 1.0, 1.0, 1.0, lmap<float>(volume,0.0,1.0,0.5,1.0) );
    gl::ScopedGlslProg glslScoped(waveformShader_);
    
    // In geometry shader, at each vertex, draw a circle with uRadius proportional to audio volume
    waveformShader_->uniform( "uNumSides", 12 );
    waveformShader_->uniform( "uRadius", lmap<float>(volume,0.0,1.0,0.0,5.0) );
    
    batch_->clear();
    batch_->color( 1.0, 1.0, 1.0, lmap<float>(volume,0.0,1.0,0.5,1.0) );
    
    
    // Draw the audio waveform as a circle. Since ends will not meet by default,
    // overlap the ends of the waveform and blends them linearly.
    
    float angle = 0;
    float blend = 50.0;
    float samples = audioBuffer.getSize()/2.0 - blend;
    float R = radius_;
    float min = -1.0 / soundSensitivity_, max = 1.0 / soundSensitivity_;
    
    unsigned int i = 0;
    while ( angle < TWO_PI + 2.0 * TWO_PI / samples ) {
        
        // blend waveform ends if necessary, then map waveform audio values to radius
        if (i < blend ){
            float scale = (float)i / blend;
            float blended = lerp<float,float>( audioBuffer[i+samples], audioBuffer[i], scale);            
            R = lmap<float>( blended, min, max, 0.0, radius_ );
        }else{
            R = lmap<float>( audioBuffer[i], min, max, 0.0, radius_ );
        }
    
        vec2 v = vec2(location_.x + R * cos(angle), location_.y + R * sin(angle));
        batch_->vertex(v);
        
        angle += TWO_PI / samples;
        i++;
    }
    
    batch_->draw();
    
}

void CircleWaveform::setRadius(float radius){
    radius_ = radius;
}
