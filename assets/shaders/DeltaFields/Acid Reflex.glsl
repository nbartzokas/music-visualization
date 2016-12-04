// ACID REFLEX

float
a01 = 30.0,
a02 = -20.0,
a11 = 1.0,
a12 = 1.5,
a21 = -0.1,
a22 = -0.1;

float A0 = a01 + rnd( a02 );
float A1 = a11 + rnd( a12 );
float A2 = A0 / A1;
float D0 = sin( ( y + x ) * A0 );

srcX = x + a21 * cos( y * A2 );
srcY = y + a21 * cos( x * A0 ) - a21;

srcX = x * ( 1.0 - a21) + srcX * a21;
srcY = y * ( 1.0 - a22) + srcY * a22;