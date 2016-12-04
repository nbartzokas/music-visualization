// G-Force deltaField
// Name: HaL_Standard_Map
// created by: Howard a. Landman; 8-9 July 2001
// e-mail: howard@polyamory.org
// homepage: http://www.polyamory.org/~howard/

// another classical chaotic attractor; called the standard map.
// See e.g. Rasband; chaotic dynamics of Nonlinear Systems; section 8.5
// as usual; recursion is run backwards and has been scaled to fit
// the screen better.  Probably here the X could be stretched more than
// the Y; but I didn't do that so as to preserve the aspect ratio of the
// original attractor.



float a0=2;		     // scale factor; larger a0 => bigger fractal
float a1=2*PI/a0;	// precompute

float d0=x - sin(a1*y)/a1;

srcX=d0;
srcY=y + d0;




