// by Jan benz | webmaster@janbenz.de

float a0=8 + flor( rnd( 24 ) );



srcT=theta + 0.001 + 0.025 * abs( sin( r * a0 ) );
srcR=r + ( 0.001 + 0.025 * abs( sin( theta * a0 ) ) ) * clip( r );


