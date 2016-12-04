// G-Force deltaField
// Name: HaL_Peacock_Tail
// created by: Howard a. Landman; 31 august-3 September 2001
// e-mail: howard@polyamory.org
// homepage: http://www.polyamory.org/~howard/



float a0=0.50 + rnd(0.05) + rnd(0.05);  // larger => more chaotic;
float a1=0.98+rnd(0.01)+rnd(0.01);      // smaller => more outward flow
float a2=2*PI;
float a3=flor(rnd(1.999));  // 0 or 1; controls reflective symmetry;
                        // 1 => mirror-symmetric in X but only sensitive to right half of screen
                        // 0 => not symmetric in X but sensitive to whole screen
float a4=1-a3;              // 1 or 0; opposite of above

// Magnify just the upper half of HaL_Peacock_Eye

float d0=x;                                 // transformed X
float d1=0.5*(y+1);                         // transformed Y
float d2=sqrt(sqr(d0) + sqr(d1));           // transformed R
float d3=atan(d1/d0) + 0.5*PI*(1-sgn(d0));  // transformed theta
// don't ask me why the second term is necessary; it just is.

float d4=a0*((PI-2*abs(a2*(wrap((d3+(0.5*PI))/a2)-0.5))));  // srcT in transformed coords
float d5=a1*d2;  // srcR in transformed coords

//srcX=d5*cos(d4);   // not necessarily symmetric in X
//srcX=d5*cos(d4)*sgn(x);   // symmetric in X
srcX=d5*cos(d4)*(a3 + a4*sgn(x));  // symmetric or not depending on a3 & a4
srcY=2*d5*sin(d4)-1;  // transformed back





