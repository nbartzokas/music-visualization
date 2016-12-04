// by august Schack
// edwanji@visto.com


float a0=sgn(.5 - rnd(1))*(6 + rnd( 2 ));//Rotation Speed
float a1=1000 + rnd( 1000 );//Rotation Falloff
float a2=rnd(.5)+rnd(.5); //X0
float a3=rnd(.5)+rnd(.5); //Y0

float a4=sgn(.5 - rnd(1))*(6 + rnd( 2 ));//Rotation Speed
float a5=1000 + rnd( 1000 );//Rotation Falloff
float a6=rnd(.5)+rnd(.5); //X1
float a7=-rnd(.5)-rnd(.5); //Y1


float a8=sgn(.5 - rnd(1))*(6 + rnd( 2 ));//Rotation Speed
float a9=1000 + rnd( 1000 );//Rotation Falloff
float a10=-rnd(.5)-rnd(.5); //X2
float a11=rnd(.5)+rnd(.5); //Y2

float a12=sgn(.5 - rnd(1))*(6 + rnd( 2 ));//Rotation Speed
float a13=1000 + rnd( 1000 );//Rotation Falloff
float a14=-rnd(.5)-rnd(.5); //X3
float a15=-rnd(.5)-rnd(.5); //Y3




/* This is silly; but deltaFields allow use of a vars and d vars.  a vars are evaluated once; when the deltaField is first opened; and the d vars are used to (presumably) calculate a value that's costly and appears multiple times in the src expressions  */



float d0=(sqr(x+a2)+sqr(y+a3));
float d1=(a0/(10+(d0*a1)));

float d2=(sqr(x+a6)+sqr(y+a7));
float d3=(a4/(10+(d2*a5)));

/*
8 d vars vs. 4 d vars makes a big difference in cPU load; observed by a lowered frame rate while it's calculated; so we'll take out 2 of the 4 swirls for now...  

float d4=(sqr(x+a10)+sqr(y+a11));
float d5=(a8/(10+(d4*a9)));

float d6=(sqr(x+a14)+sqr(y+a15));
float d7=(a12/(10+(d6*a13))); 

srcX=x + ( d1*(y+a3) + d3*(y+a7) + d5*(y+a11) + d7*(y+a15) );
srcY=y - ( d1*(x+a2) + d3*(x+a6) + d5*(x+a10) + d7*(x+a14) );  */


// The x and y exprs w/ 2 swirls removed
srcX=x + ( d1*(y+a3) + d3*(y+a7) );
srcY=y - ( d1*(x+a2) + d3*(x+a6) );



