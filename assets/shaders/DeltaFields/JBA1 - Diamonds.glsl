// by Jan benz | webmaster@janbenz.de

float a0=8 + flor( 56 * rnd( 1 ) );



srcT=theta - 0.025 * sin( theta * a0 ) * cos( r * a0 );
srcR=r - 0.025 * sin( r * a0 ) * cos( theta * a0 ) * clip( r );


