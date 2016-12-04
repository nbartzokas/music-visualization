


float a0=rnd( 2 ) - 1;
float a1=rnd( 2 ) - 1;
float a2=.999 - rnd( .04 );

float a3=a0 * ( 1 - a2 );
float a4=a1 * ( 1 - a2 );

srcX=x * a2 + a3;  //( x - a0 ) * a2 + a0;
srcY=y * a2 + a4;  //( y - a1 ) * a2 + a0;


