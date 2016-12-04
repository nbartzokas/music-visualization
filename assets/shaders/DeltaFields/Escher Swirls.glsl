// Escher Swirls; by Erlend Robaye; November 2001
// Ode to M.c. Escher; one of the greatest artist that ever roamed are small blue planet


float a0=rnd(27);		// Period of first sin
float a1=rnd(35);		// Period of second sin
float a2=rnd(.05) + .01;	// Flow speed
float a3=rnd(.05) + .01;	// Rotation speed

srcR=r     * ( 1 - sin( theta * a0) * sin( theta * a1) * a2 );
srcT=theta -       sin( r     * a0) * sin( r      *a1) * a3 ;



