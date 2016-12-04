// by Jan benz | webmaster@janbenz.de

float a0=1.5 + rnd( 1.5 );



float d0=0.05 *   abs( sin( r * a0 + theta ) );

srcT=theta + d0;
srcR=r -    ( d0   + 0.005 ) * clip( r );


