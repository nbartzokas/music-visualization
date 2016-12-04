//
//  Splat.cpp
//  MusicVisualization
//
//  Created by NBartzokas on 10/8/16.
//
//

#include <stdio.h>
#include "cinder/Rand.h"
#include "Splat.h"

using namespace std;
using namespace ci;
using namespace ci::app;

static float
gaussianDeviation = 100.0f,
rMin = 5.0,
rMax = 50.0;

Splat::Splat( ci::vec2 pos ):position_(pos),color_( hsvToRgb(vec3( randFloat(1), .5, 1.0 )) ){
    
    // fill "drips" vector with randomly placed / sized circles
    // where drips further from center tend to be smaller
    
    int numDrips = randInt(10,20);
    for (int i=0; i<numDrips; i++){
        
        ci::geom::Circle drip;
        
        float gaussian = fmin( 2.0, randGaussian() );
        float distance = abs( gaussian * gaussianDeviation );
        
        // set position
        vec2 dripOffset = randVec2() * distance;
        vec2 dripPosition = position_ + dripOffset;
        drip.center( dripPosition );
        
        // set radius
        float R = randFloat(rMin,rMax);
        float r = R - R * randFloat(0.8, 1.0) * distance / ( 2 * gaussianDeviation );
        drip.radius( r );
        drip.subdivisions( fmax(r,50) );
        
        drips_.push_back(drip);
    }
}

void Splat::update(){
}

void Splat::draw(){
    
    for (auto &drip:drips_){
        gl::ScopedColor scopedColor(color_);
        gl::draw(drip);
    }

}
