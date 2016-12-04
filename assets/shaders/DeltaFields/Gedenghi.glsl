// Gedenghi ; by Erlend Robaye; October 2001



float a0=rnd(.004) + .002;	// Rotation speed
float a1=rnd(30) + 8;	// amplitude of sin that devides into rays of flow
float a2=rnd(16) + 4;	 // amplitude of sin that devides into circles of rotation
float a3=2*PI*a2;

// Flow gently in or out
srcR=r * ( 1 + sgn(sin( theta * a1)) * .01);

// Turn left or right depending on sign of sin.
srcT=theta + a0 * sgn( sin(r*a3) );


