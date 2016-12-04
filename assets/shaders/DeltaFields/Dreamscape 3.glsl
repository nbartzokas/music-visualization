// dreamscape 3 by demonseed
// based on Sunburst - Many
// Welcome to My World... a world of Magic; of Mystery........Of dreams



float a0=trnc( 18 + rnd( 5 ) ) * PI;


//a0=sgn(.5 - rnd(1))*(6 + rnd( 2 ));//Rotation Speed
float a1=1000 + rnd( 1000 );//Rotation Falloff
float a2=rnd(.5)+rnd(.5); //X0
float a3=rnd(.5)+rnd(.5); //Y0

float a4=sgn(.5 - rnd(1))*(6 + rnd( 2 ));//Rotation Speed
float a5=1000 + rnd( 1000 );//Rotation Falloff
float a6=rnd(.5)+rnd(.5); //X1
float a7=-rnd(.5)-rnd(.5); //Y1



float d0=(a0/(10+( (sqr(x+a2)+sqr(y+a3)) *a1)));


float d1=(a4/(10+( (sqr(x+a6)+sqr(y+a7)) *a5)));



srcR=( ( 1 + sin( a0 * theta ) )* .03 + .92 ) * r;  // .03 == .06 * .5
srcT=theta - (d0*(x+a2) + d1*(x+a6));


