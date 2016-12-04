// created by Thomas Geier
//ziggystar@gmx.de
//claustrophobia

//I know; this (or something similar) already exists
//I made a rotating version

float a0=rnd( PI );		  // angle
float a1=rnd( 0.25 );		// speed

srcR=r-sqr(cos(theta+a0)*r)*a1-.002;
srcT=theta + rnd( .008 ) - .004;


