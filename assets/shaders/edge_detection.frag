#version 150

/*
 edge detection shader based on:
 https://coding-experiments.blogspot.com/2010/06/edge-detection.html
*/

out vec4 oColor;
uniform sampler2D tex;
in vec2 TexCoord0;

uniform float threshold1;
uniform float threshold2;
uniform float threshold3;

uniform float volume;

float threshold(in float thr1, in float thr2 , in float val) {
    if (val < thr1) {return 0.0;}
    if (val > thr2) {return 1.0;}
    return val;
}

// averaged pixel intensity from 3 color channels
float avg_intensity(in vec4 pix) {
    return (pix.r + pix.g + pix.b)/3.;
}

vec4 get_pixel(in vec2 coords, in float dx, in float dy) {
    return texture(tex,coords + vec2(dx, dy));
}

// returns pixel color
float IsEdge(in vec2 coords){
    float dxtex = 1.0 / 512.0 /*image width*/;
    float dytex = 1.0 / 512.0 /*image height*/;
    float pix[9];
    int k = -1;
    float delta;
    
    // read neighboring pixel intensities
    for (int i=-1; i<2; i++) {
        for(int j=-1; j<2; j++) {
            k++;
            pix[k] = avg_intensity(get_pixel(coords,float(i)*dxtex,
                                             float(j)*dytex));
        }
    }
    
    // average color differences around neighboring pixels
    delta = (abs(pix[1]-pix[7])+
             abs(pix[5]-pix[3]) +
             abs(pix[0]-pix[8])+
             abs(pix[2]-pix[6])
             )/4.;
    
    return threshold( threshold1, threshold2, clamp(threshold3 * delta, 0.0, 1.0) );
}

void main()
{
    
    if ( IsEdge(TexCoord0.xy) < 0.1 ){
        discard;
    }else{
        oColor.rgb = vec3( 0.5 );
        oColor.a = 1;
    }
    
}