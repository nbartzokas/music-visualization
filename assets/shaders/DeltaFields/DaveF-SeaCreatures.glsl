// daveF!   In an Octopusses garden in the shade...
// based on Poinsetta by demonseed

float a0=8;	// number of petals the flower has.  try 5 for a starfish
float a1=.016; // speed of colour and spin - needs tweaking to avoid glitches.  .016
float a2=4;	//tightness of curls.  in combination with a3 0 - 5
float a3=2;	//speed of colour movement.  0 - 5



srcR=r + (a1*a2) * sin( a0 * theta );
srcT=theta + (a1*a3) * sin( a0 * r );


