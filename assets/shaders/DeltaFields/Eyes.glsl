// Eyes by Kasuha



float a0=1+rnd(1);
float a1=0.05+rnd(0.2);
float a2=( 0.5+rnd(.5) ) / a0;


float d0=2 * x * y * a0;
float d1=( y * y - x * x ) * a0 + a2;

float d2=a1 * ( rnd(2) - 1 );

srcX=x+(d0-x)*d2;
srcY=y+(d1-y)*d2;




