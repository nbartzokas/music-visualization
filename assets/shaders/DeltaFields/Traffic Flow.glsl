



float a0=.005 + rnd( .03 );        // How fast the traffic flow is
float a1=a0 * ( .9 + rnd( .1 ) );  // How blurry the buildings are

srcX=x + a0 * sin( 8 * y ) - abs( a1 * sin( 8 * y ) );
srcY=y + a0 * cos( 8 * x ) - abs( a1 * cos( 8 * x ) );

