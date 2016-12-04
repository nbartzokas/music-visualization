



float a0=rnd( .1 );      // osc magnitde
float a1=3 + rnd( 7 );   // osc freq
float a2=.9 + rnd( .3 );  // Sphere radius

srcR=r * ( 1 + .09 * ( r - a2 ) );
srcT=theta + a0 * sin( a1 * r );


