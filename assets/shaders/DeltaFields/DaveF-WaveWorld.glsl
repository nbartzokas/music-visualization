//daveF!    world of waves.

float a0=.03 + rnd(.03);		//size of wave peak.
float a1=5 + trnc(rnd(30));  	//number of curls
float a2=0.011 + rnd(.03);		//size of wave



srcT=theta + a0 * sin(r * 8);
srcR=r + a2 * sin(theta * a1);


