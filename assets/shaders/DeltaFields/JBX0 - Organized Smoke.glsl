// by Jan benz | webmaster@janbenz.de

float a0=8 + flor( rnd( 24 ) );



srcX=x + 0.00125 + 0.025 * abs( sin( y * a0 ) ) * sgn( sin( y * a0 * 0.25 ) ) * sin( y * a0 * 0.125 );
srcY=y + 0.00125 + 0.025 * abs( sin( x * a0 ) ) * sgn( sin( x * a0 * 0.25 ) ) * sin( x * a0 * 0.125 );


