// G-Force deltaField
// Name: HaL_Quadrupole
// created by: Howard a. Landman; 3 September 2001
// Optimized: 15-16 September 2001
// e-mail: howard@polyamory.org
// homepage: http://www.polyamory.org/~howard/

// an accident while trying to do HaL_Peacock_Tail.
// Seemed pleasant enough to keep; and simplify.



float a0=0.50 + rnd(0.05) + rnd(0.05);  // larger => more chaotic
float a1=0.98 + rnd(0.01) + rnd(0.01);  // smaller => more outward flow
float a2=2*PI;
float a3=1/a2;
float a4=0.25;  // fraction of a circle to rotate the pattern
// If a4 is zero then the pattern has a mirror symmetry in Y
// and sensitive zone is on the left.
// I prefer it on top; so rotate by PI/2 = 1/4 of a circle.
float a5=a2*a4;

// old formula (Sept.3); doesn't use a3-a4-a5.
// srcT=a0*((PI-2*abs(a2*(wrap((PI-theta)/a2)-0.5))));

// new formula; rotated 90 degrees and optimized a bit (Sept. 15-16)
// The reason this is a bit tricky with a3 and all is to keep the tent
// centered as we rotate the orientation with a4 and a5.
srcT=a0*(PI - 2*abs(a2*(wrap(a3*theta + a4) - 0.5))) - a5;

srcR=a1*r;





