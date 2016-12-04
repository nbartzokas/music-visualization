# Delta Fields

The .glsl files in this directory are special, partial shaders that contain delta field equations. They get loaded into the deltafield.frag template shader. The "delta field" algorithm was used in an old music visualization program called G Force. In a delta field, each pixel uses an equation to find another pixel from which it will derive its next color value. G force used a set of plain text files that defined delta field equations and were written in a shader-like language. The .glsl files in this directory are slightly modified versions of those text files. For some more detail on their contents see documentation here: [http://www.soundspectrum.com/g-force/Documentation/config-programming.html](http://www.soundspectrum.com/g-force/Documentation/config-programming.html)


