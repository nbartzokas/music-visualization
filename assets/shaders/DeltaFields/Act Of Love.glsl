// act Of Love by demonseed (modified)
// based on:
// Galaxy & Swirl Your Mind

float l0 = .01, l2 = .1, l3 = .021, l4 = 2.0, l5 = 2.0, l6 = .17, l7 = 2., l8 = 6.28,
l9 = 1.0-0.0, lA = 0.0, lB = 1.0-0.977465, lC = 0.977465;
float a0 = PI;
float a1 = rand ( l0 * ( .5+rand(.5)+rand(.5) ));
float a2 = rand ( l2 * ( .5+rand(.5)+rand(.5) ));
float d0 = l3 * ( pow( sqrt( pow( y - a1, l4 ) + pow( x - a0, l5 ) ) + l6, a2 ) );
//Aspc=1 force aspect ratio to 1:1
float d1 = l7 * theta + l8 * r + a0;
srcX = x - (a1 * cos( d0 )) * ((x - ( y - a1 ) * d1) * rand(-1.0));
srcY = y - (a2 * sin( d1 )) * ((y - ( x - a0 ) * d0) * rand(-1.0));
srcX = x * l9 + srcX * lA;
srcY = y * lB + srcY * lC;