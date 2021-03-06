

// G-Force deltaField
// Name: HaL_Julia_Seahorse
// created by: Howard a. Landman; 16 May 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/

// This deltaField refracts the waves through the lens of a Julia set;
// the fractal generated by the recursion relation z = z^2 + c
// for z = (x + i*y)
// and c = 0.74543 - 0.11301i
// This particular Julia set is fairly famous
// and is known as the seahorse.
//
// It is not possible to code a true Julia set recursion as a deltaField
// (dFs can be 1-to-1 or 1-to-many mappings; but Julia sets are many-to-1)
// so this is the reverse Julia recursion.  The difference is that a
// forward one would have everything flowing away from the set boundary -
// points outside the set would head off to infinity while points inside
// the set would spiral down into attractive basins (with points on or
// near the boundary bouncing around chaotically).  In a reverse one;
// points outside the set are sucked onto it; while points inside spiral
// up out of the basins to get plastered against the boundary as well.
// Usually the interior is visually more interesting; so we want it to
// fill as much of the screen as possible.

// Fitting  means we fit no matter what the screen aspect ratio


// Scale to fit screen
float a0=1.53;  // X scaling; smaller a0 => wider fractal
float a1=0.89;  // Y scaling; smaller a1 => taller fractal
float a2=2*a0*a1;

// Normal orientation would be like this
srcX=(sqr(a0*x) - sqr(a1*y) - 0.74543)/a0;
srcY=(a2*x*y + 0.11301)/a1;


// The sign reversal above (i.e. subtracting 0.74543 instead of adding)
// is necessary because we're running the Julia set backwards.



