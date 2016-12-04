//
//  CircleWaveform.h
//  MusicVisualization
//
//  Created by NBartzokas on 10/8/16.
//
// 

#ifndef CircleWaveform_h
#define CircleWaveform_h

#include "cinder/app/App.h"
#include "cinder/app/RendererGl.h"
#include "cinder/audio/Context.h"
#include "cinder/gl/gl.h"

using CircleWaveformRef = std::shared_ptr<class CircleWaveform>;

class CircleWaveform{
    
public:
    
    static CircleWaveformRef create(const size_t sz, const ci::vec2 l){
        return CircleWaveformRef( new CircleWaveform( sz, l ) );
    }
    CircleWaveform(size_t sz, ci::vec2 l);
    void update();
    void draw(const ci::audio::Buffer& b, const float v);
    void setRadius(float radius);
    
private:
    
    float radius_ = 500.0;
    ci::vec2 location_;
    float soundSensitivity_ = 0.25;
    ci::gl::VertBatchRef batch_;
    ci::gl::GlslProgRef	waveformShader_;
    
};

#endif /* CircleWaveform_h */
