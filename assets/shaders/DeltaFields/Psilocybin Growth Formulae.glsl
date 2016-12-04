//Propagates the visions of psilocybin mexicana ingestion with eyes closed
//From Erich Kodotai               kodotai@mac.com

float a0=rnd(44) + 120.113;
float a1=( 1 + rnd( .146517 ) );
float a2=a0 / a1;
float d0=sin( ( theta + r ) * a0 );

srcT=theta + 0.0127 * cos( y * a2 );
srcR=r + wrap( r ) * ( 0.01 * cos( x * a0 ) - 0.0120 );


