// Glassfiber Realm; by Erlend Robaye; October 2001



float a0=rnd(30) + 10;
float a1=rnd(.06) + .03;	// Flow Speed

// Take an image of the current situation; inside this radius
srcR=r * (1 - r * a1);

// Rotate the image a bit
srcT=theta + sin(theta * a0) * .1;


