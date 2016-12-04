#version 150

layout(points) in;
layout(line_strip, max_vertices = 64) out;

in vec4 vColor[]; // Output from vertex shader for each vertex
out vec4 gColor; // Output to fragment shader

uniform int uNumSides;
uniform float uRadius;

uniform mat4 ciProjectionMatrix;

const float PI = 3.1415926;

// At each vertex, draw a circle with uRadius proportional to audio volume
void main()
{
    gColor = vColor[0];
    
    for( int i = 0; i <= uNumSides; i++ ) {
        float ang = PI * 2.0 / uNumSides * i;
        vec4 offset = vec4( cos(ang) * uRadius, -sin(ang) * uRadius, 0.0, 0.0 );
        gl_Position = ciProjectionMatrix * (gl_in[0].gl_Position + offset);
        EmitVertex();
    }
    
    EndPrimitive();
}