// Sunscape ; by Erlend Robaye; October 2001



float a0=flor( 2 + rnd( 30 ) );	// amplitude of sin that devides into circles

// Flow gently in or out
srcR=r * ( 1 + sgn(sin( theta * a0)) * .01);

// Turn right
srcT=theta + .0002;


