

// G-Force deltaField
// Name: HaL_Sublime
// created by: Howard a. Landman; 25 May 2001
// Tweaks and comments: 7 June 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/



float a0=rnd(0.08)-rnd(0.08);  // degree of randomness; 0=none; .1=high
float a1=0.86+rnd(0.23);  // controls rate of expansion/contraction
float a2=rnd(0.06)-rnd(0.06);  // X direction and speed of wind
float a3=rnd(0.06)-rnd(0.06);  // Y direction and speed of wind
srcX=a0*(rnd(1)-rnd(1)) + a1*x + a2;
srcY=a0*(rnd(1)-rnd(1)) + a1*y + a3;

// This is another highly variable dF.  It can look like Noise
// or a linear flow or many other things.  The idea is that
// for a long performance it would look different every time
// and not get boring.

// Note the trick of adding 2 (or more) random variables to
// get something like a Gaussian distribution.



