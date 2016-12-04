// daveF!  Neucleus

float a0=3;  //changes number of stripes
float a1=2+rnd(3.82);

srcR=r + 0.06 * pos( a1 / cos( r * a0 + .0001 ) );
srcT=theta - 0.01 * pos( sin( theta * a0 ) );



