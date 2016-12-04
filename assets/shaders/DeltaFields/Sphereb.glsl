



float a0=.08;      // osc magnitde
float a1=6;   // osc freq
float a2=0.9;  // Sphere radius

srcR=r * ( 1 + .09 * ( r - a2 ) );
srcT=theta + a0 * sin( a1 * r );


