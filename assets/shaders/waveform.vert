#version 150

in vec4 ciPosition;
in vec4 ciColor;

uniform mat4 ciModelView;

out vec4 vColor;

void main()
{
    gl_Position = ciModelView * ciPosition;
	vColor = ciColor;
}