/*
 *  Uber concert by Uberbach. Uberbach@SoneraMail.nl
 *
 */


float a0=rnd(100)+2;

srcX=x+( 0.01/( sqrt(abs(x)) + .0001 ) ) *sin(x);
srcY=y+sin(x*y*a0)/100;

