
float a0=17; // 2 + rnd( 16 );
float a1=.020; // * ( 1 + rnd( 4 ) );



srcX=x - sgn( x ) * a1 * ( 1 - cos( a0 * x ) ) - .02 * x + .001 - rnd( .002 );
srcY=y + .001 - rnd( .002 );


