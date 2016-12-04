// created by lunabunny (lunabunny@hotmail.com)
// concentricity

float a0=6 + flor( ( 1 + rnd( 2 ) ) * rnd( 20 ) );   // ring width
float a1=0.01 + rnd(0.05);                           // rotation speed

srcR=r;
srcT=theta + a1 * sgn( sin( r * a0 ) );




