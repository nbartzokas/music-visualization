// Quantum Ripple by dJ alter-N8 (djaltern8@earthlink.net)
// Inspired by andy's Quantum Theta
// Inspired by Justin and Jesse Swidler's Spinner



float a0=2 * trnc( 2 + rnd( 6 ) );
float a1=1.04 + rnd( .4 );
float a2=rnd(.02);


srcR=(r * .97) + (r * a2 * sin(theta));
srcT=theta + a2 * (rnd(a1) * ( 2 + sin( 7 * r ) + sin( a0 * theta) ));


