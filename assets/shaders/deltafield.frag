#version 150



// This shader implements the "delta field" algorithm used in an old music visualization
// program called G force. In a delta field, each pixel uses an equation to find another
// pixel from which it will steal its color value. The easiest example to imagine is an
// equation that slides the contents of the screen steadily sideways. Each pixel adds a
// constant to their own coordinates and grabs the color of the new coordinates.

// G force used a set of plain text files, let's call them partial shaders, that defined
// delta field equations and were written in a shader-like language. This shader program
// provides a wrapper for those partials with the environment they expect, two template
// insertion points into which the original plain text files can be inserted with little
// or no editing, and some code that crossfades between them.

// Another approach, and perhaps better practice, would have been to rely on the GPU's
// pipeline, but would have required more overhead and more alterations of the partial
// shaders. Maybe for a future version.



#define PI 3.1415926535897932384626433832795

in vec2             screenSize;

in vec2				TexCoord0;
out vec4			outputColor;

uniform sampler2D	uTex0;
uniform float       fadeSpeed;  // speed of fadeout of the graphics seeded into deltafield
uniform float       crossfade;  // speed of crossfade between partial shaders

uniform float       time;



#pragma mark utility and convenience methods

// complex number multiplication
vec2 c_mult(vec2 a, vec2 b) {
    return vec2(a.x * b.x - a.y * b.y, (a.x+a.y)*(b.x+b.y) - a.x*b.x - a.y*b.y);
}

// random number generators
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}
float rand(float c){
    vec2 co = vec2(c,c);
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}
float rnd(float r){
    return rand(r);
}

// triangle wave generator
float trwv(float x){
    return 1.0 - abs( mod(x,2.0) - 1.0);
}
// square wave generator
float sqwv(float x){
    return mod(x,6) < 3 ? 3 : 0;
}
// sine wave generator
float snwv(float x){
    return 3 * sin( x / 10 );
}

// positive: returns x if x > 0 and 0 otherwise
float pos(float x){
    if (x>0) return x;
    else return 0;
}

// square
float sqr(float x){
    return pow(x,2.0);
}

//TODO: stub for random seeding
float seed(float x){
    return x;
}

// truncate rename
float trnc(float x){ return trunc(x); }

// sign rename
float sgn(float x){ return sign(x); }

// floor rename
float flor(float x){ return floor(x); }

// return 0 when x < 0, 1 when x > 1, and x when 0 <= x <= 1
float clip(float x){
    return clamp(x,0,1);
}

// loop value around 0 (inclusive) to 1 (exclusive) range
float wrap(float x){
    return x - floor( x );
}

// color conversion
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}



#pragma mark main

void main(){
    
    vec2 v = TexCoord0.xy;

    // center x/y
    float x = v.x - (screenSize.x/2.0);
    float y = v.y - (screenSize.y/2.0);
    
    // convert to polar
    float theta = atan(y,x);
    float r = sqrt( pow(x,2.0) + pow(y,2.0) );
    bool polar=false;
    
    float srcX = 0, srcY = 0, srcR = 0, srcT = 0, t = time;
    
    // This is a template insertion point; the block's contents are substituted
    // before this shader is compiled. There are two such blocks to allow
    // each partial shader to crossfade their effects between each other.
    {
    //_1
    }
    
    if ( srcX == 0 && srcY == 0){
        polar = true;
    }else{
        polar = false;
    }
    
    // return from polar
    if (polar){
        x = srcR * cos(srcT);
        y = srcR * sin(srcT);
    }else{
        x = srcX;
        y = srcY;
    }
    
    // return from center
    float x1 = x + (screenSize.x/2.0);
    float y1 = y + (screenSize.y/2.0);
    
    
    
    
    // reset all
    v = TexCoord0.xy;
    x = v.x - (screenSize.x/2.0);
    y = v.y - (screenSize.y/2.0);
    theta = atan(y,x);
    r = sqrt( pow(x,2.0) + pow(y,2.0) );
    polar=false;
    srcX = 0, srcY = 0, srcR = 0, srcT = 0;
    
    // The second template insertion point (see above)
    {
    //_2
    }
    
    if ( srcX == 0 && srcY == 0){
        polar = true;
    }else{
        polar = false;
    }
    
    // return from polar
    if (polar){
        x = srcR * cos(srcT);
        y = srcR * sin(srcT);
    }else{
        x = srcX;
        y = srcY;
    }
    
    // return from center
    float x2 = x + (screenSize.x/2.0);
    float y2 = y + (screenSize.y/2.0);
    
    
    // crossfade
    v.x = mix(x1,x2,crossfade);
    v.y = mix(y1,y2,crossfade);
    
    
    // OUT
    outputColor = texture( uTex0, v);
    
    if (outputColor.r >= 0.01) outputColor.r -= fadeSpeed;
    else outputColor.r = 0.0;
    if (outputColor.b >= 0.01) outputColor.b -= fadeSpeed;
    else outputColor.b = 0.0;
    if (outputColor.g >= 0.01) outputColor.g -= fadeSpeed;
    else outputColor.g = 0.0;
    
}