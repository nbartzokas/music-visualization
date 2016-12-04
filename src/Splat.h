//
//  Splat.h
//  MusicVisualization
//
//  Created by NBartzokas on 10/8/16.
//
//

#ifndef Splat_h
#define Splat_h

#include "cinder/app/App.h"
#include "cinder/app/RendererGl.h"
#include "cinder/gl/gl.h"

using SplatRef = std::shared_ptr<class Splat>;

class Splat{
    
public:
    
    static SplatRef create( const ci::vec2 pos ){
        return SplatRef( new Splat( pos ) );
    }
    Splat( const ci::vec2 pos );
    void update();
    void draw();
    
private:
    
    ci::vec2 position_;
    ci::Color color_ = ci::Color(255,0,0);
    
    std::vector<ci::geom::Circle> drips_;
    
};

#endif /* Splat_h */
