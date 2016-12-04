//daveF!   Surfs up.


float a0=2 * trnc( 2 + rnd( 6 ) );
float a1=1.04 + rnd( .4 );
float a2=rnd(.02);


srcX=(x * .97) + (x * a2 * sin(y));
srcY=y + a2 * (rnd(a1) * ( 2 + sin( 7 * x ) + sin( a0 * y) ));


 
