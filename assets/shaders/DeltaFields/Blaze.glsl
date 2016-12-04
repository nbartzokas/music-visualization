// BLAZE (modified)

float
b0=0,
b1=0.001,
b2=1,
b3=10.0,
b4=0.0009,
b5=0.0073,
b6=0.001,
b7=0.0004,
b8=2.0,
b9=-0.0029;

srcX = x + b0 * ( b1 * 10.0 - rand( pow( cos(x * b2 * 100.0), b3 ))) + b4 * sin(theta * PI);
srcY = y + b5 * ( b6 * 10.0 - rand( pow( sin(x * b7 * 100.0), b8 ))) + b9 * cos(r * PI);
