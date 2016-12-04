// julia

float
j0 = 4.0 + 4.0 * sin( time / 1.0 ) / 20.0,
j1 = -4.0 -4.0 * cos( time/1.0 )/20.0,
j2 = -0.02 -0.02 * sin( time/1.0 )/20.0,
j3 = -7.5 -7.5 * sin( time/1.0 )/2.0,
j4 = 0.27 + 0.27 * sin( time/1.0 )/20.0,

j5 = 2.0 + 2.0 * sin( time/1.0 )/20.0,
j6 = 2.0 + 2.0 * sin( time/1.0 )/20.0,

j7 = -0.2 -0.2 * sin( time/1.0 )/20.0,
j8 = -0.35 -0.35 * sin( time/1.0 )/20.0,
j9 = 2.4 + 2.4 * sin(  time/1.0 )/20.0,
jA = 2.0,
jB = 2.0,
jC = 2.0;

srcX = j0 * pow(x, j5) + j1 * pow(y, j6) + j2;
srcY = j3 * x * y + j4  + j7 * pow(x,j8) + j9 * pow(y,jA);