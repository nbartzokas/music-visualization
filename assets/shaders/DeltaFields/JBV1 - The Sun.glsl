// by Jan benz | webmaster@janbenz.de

float a0=1 - rnd( 2 );
float a1=1 - rnd( 2 );



float d0=abs( cos( sqrt( sqr( x + a0 ) + sqr( y + a1 ) ) * 8 ) );

srcX=x - ( ( x + a0 ) * 0.025 ) * d0 - ( ( x + a0 ) * 0.001 );
srcY=y - ( ( y + a1 ) * 0.025 ) * d0 - ( ( y + a1 ) * 0.001 );


