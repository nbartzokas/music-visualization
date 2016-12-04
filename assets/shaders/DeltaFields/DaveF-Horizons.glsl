//daveF!  Horizons.  Looks very trippy with particles through the centre

float a0=trnc( 8 + rnd( 5 ) ) * PI;
float a1=.5 * .06;
float a2=rnd(3.006); //ripple or wave size. 

srcR=( ( 1 + atan( a0 * theta ) ) * a1 + .93  ) * r;
srcT=theta + ( .025 * sin(20 * r) );


