// G-Force deltaField
// Name: HaL_Mystery_box
// created by: Howard a. Landman; 26 July 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/

// dedicated to Mickey Hart

// This one jumps through flaming hoops to invert the radius while still
// remaining completely true to the rectangular boundary.  Then it throws
// a touch of chaos and rotation into the inversion just to pretty things up.

// The 0.000001 terms are to prevent divide-by-zero problems.
// Try taking them out and you'll see what I mean.



float a0=rnd(0.2)-rnd(0.2);    // speed of rotation

float a1=1+rnd(0.2)-rnd(0.1);  // degree of chaos; 0.9 to 1.2
                           // When this is < 1 we get a mystery box in the middle.
                           // When it's > 1 we get more of a rectangular corridor with no blatant box.

// calculate maximum radius at this angle without going outside of the screen
float d0=sgn(abs(sin(theta))-abs(cos(theta)));  // positive if sine is bigger than cosine
float d1=(d0+1)*0.5;  // 1 if sine is bigger than cosine; 0 otherwise
float d2=d1/(abs(sin(theta))+0.000001) + (1-d1)/(abs(cos(theta))+0.000001); // max radius at our T

// calculate maximum radius at source angle without going outside of the screen
float d3=sgn(abs(sin(theta+a0))-abs(cos(theta+a0)));  // positive if sine is bigger than cosine
float d4=(d3+1)*0.5;  // 1 if sine is bigger than cosine; 0 otherwise
float d5=d4/(abs(sin(theta+a0))+0.00001) + (1-d4)/(abs(cos(theta+a0))+0.00001); // max radius at srcT

//srcR=d5*(1 - r/d2);         // This would be the simple inversion
                                // maxR - R; *not* 1/R !)
srcR=d5*a1*((1 - r/d2)-0.5);  // inversion with a bit of chaos
srcT=theta + a0;              // some rotation too

// actually working out the right math here was fun -
// I haven't had to use secants in a while.





