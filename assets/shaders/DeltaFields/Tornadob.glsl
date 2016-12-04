// Into the Eye of the Storm - Tornado by demonseed
// based on simple Sine Sphere (oval)

float b0=exp(time*50);
srcR=r + .02 * sin(  37.6991118 * r );
srcT=theta + ((0.015-0.015*time*sin(700*pow(theta,2)))*r);

// orig ???
//float b0=exp(dt*50);
//srcR=r + .02 * sin(  37.6991118 * r );
//srcT=theta + ((0.015-0.015*clock()*sin(700*t^2))*r)

// - 15*r*sin(t*b0));
