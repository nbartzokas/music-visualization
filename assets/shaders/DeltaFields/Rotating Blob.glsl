// Rotating blob ; by Erlend Robaye; November 2001



float a0=(rnd(.02) + .01 ) * sgn(sin(rnd(2*PI)));	// Rotation speed
float a1=trnc(rnd(8) + 4);				             // amplitude of sin that devides into circles
float a2=.03;					                         // Flow increase factor

// Flow gently in or out
float d0=sin( theta * a1);

srcR=r * ( 1 + a2 * d0);

// Turn right
srcT=theta + a0;


