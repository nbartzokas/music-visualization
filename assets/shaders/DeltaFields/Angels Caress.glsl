// angel's caress by demonseed
// based on:
// Galaxy & Swirl Your Mind

float a0=PI;
float a1=rnd (.01 * ( .5+rnd(.5)+rnd(.5) ));
float a2=rnd ( .1 * ( .5+rnd(.5)+rnd(.5) ));

float d0 = .021 * ( pow( sqrt( sqr( y - a1 ) + sqr( x - a0 ) ) +.17 , a2) );
float d1 = 2 * theta+6.28*r+a0;

srcR=r     - (a1 * cos( d0 )) * ((x - ( y - a1 ) * d1) * rnd(-1));
srcT=theta - (a2 * sin( d1 )) * ((y - ( x - a0 ) * d0) * rnd(-1));




