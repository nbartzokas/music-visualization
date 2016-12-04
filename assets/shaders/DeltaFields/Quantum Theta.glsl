// Quantum Theta by andy
// Inspired by Justin and Jesse Swidler's Spinner



float a0=2 * trnc( 2 + rnd( 5.5 ) );  //  Quantum: How many pie pieces we have
float a1=1.03 + rnd( .4 );            //  Speed factor

float a2=.92 + rnd( .10 );   // Flow rate in/out
float a3=.005 + rnd( .03 );  // Turn rate

srcR=r * a2;
srcT=theta + a3 * ( a1 + sin( a0 * theta ) );


