//daveF!   Starlight.  Reminds me of the halos in some church Stain Glass.


float a0=8;	// number of petals the flower has.  try 5 for a starfish
float a1=rnd(.009); // speed of colour and spin - needs tweaking to avoid glitches.  .016
float a2=2+rnd(4);	//tightness of curls.  in combination with a3 0 - 5
float a3=1+rnd(4);	//speed of colour movement.  0 - 5



srcT=theta + (a1*a2) * sin( a0 * r );
srcR=r + (a1*a3) * sin( a0 * theta );


