

// G-Force deltaField
// Name: HaL_LdZ-04+131
// created by: Howard a. Landman; 7 June 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/



// complex plane version of logistic difference equation.
// srcZ = lambda*z*(1-z)
// = (a + bi)*(x + yi)*((1 - x) - yi)
// = (a*x*(1-x) + a*y*y + b*x*y - b*y*(1-x))
//   + i(b*x*(1-x) + a*y*(1-x) - a*x*y + b*y*y)
//
// Except; we adjust to (1/2 + z)*(1/2 - z) instead to center it
// on the screen
//
// This equation gives fractals which are close cousins of Julia sets.

float a0=-0.4;  // a
float a1=1.31;  // b
float a2=0.9;   // X scaling - smaller a2 => wider fractal
float a3=0.6;   // Y scaling - smaller a2 => taller fractal 



// Unoptimized eqns...
// srcX=(a0*(0.5+a2*x)*(0.5-a2*x) + a0*sqr(a3*y) + a1*(0.5+a2*x)*a3*y - a1*a3*y*(0.5-a2*x))/a2;
// srcY=(a1*(0.5+a2*x)*(0.5-a2*x) + a0*a3*y*(0.5-a2*x) - a0*(0.5+a2*x)*a3*y + a1*sqr(a3*y))/a3;




// Optimized eqns...


float a4=2 * a1 * a3;
float a5=2 * a2 * a0;

float a6=a0 / a2;
float a7=a1 / a3;

float d0=0.25 - sqr(a2*x) + sqr(a3*y);

srcX=a6 * d0 + a4 * y * x;
srcY=a7 * d0 - a5 * y * x;


