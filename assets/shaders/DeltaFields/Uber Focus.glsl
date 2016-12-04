/*
 *  Uber Focus by Uberbach. Uberbach@SoneraMail.nl
 *
 */


float d0=sqr( x*x + y*y )*2 + .0001;
float d1=(rnd(.02)-.01)/d0;
float d2=(rnd(.02)-.01)/d0;
srcX=x+d1-.001*x;
srcY=y+d2-.001*y;

