// contrail by andy

float a0=rnd( 2 * PI );      // Random angle
float a1=rnd( .028 ) + .002; // Random flow rate
float a2=a1 * sin( a0 );     // x component
float a3=a1 * cos( a0 );     // y component

srcX=x + a3;
srcY=y + a2;


