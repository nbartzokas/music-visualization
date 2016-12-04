#version 150

uniform mat4	ciModelViewProjection;
in vec4			ciPosition;
in vec2			ciTexCoord0;
in vec2         ciWindowSize;
out vec2		TexCoord0;
out vec2        screenSize;

void main( void ) {
    screenSize = ciWindowSize;
    gl_Position	= ciModelViewProjection * ciPosition;
    TexCoord0 = ciTexCoord0;
}