
/* 
  This documents how a G-Force deltaField works.  Please be familiar with the information already presented in the G-Force documentation.  Next; read the info in the colorMap colorWheel.

  G-Force will run what this file says for every pixel of the output frame; and a deltafield does no more than return a 2d coordinate given some other coordinate.  deltafields can access this coordinate using one or more of X; Y; R; and THETa; with the center of the frame as (0;0).  Remember that the goal of a deltafield is to return a source coordinte for the given coordinate; and deltafields return this coordinate in one of two ways:

1) defining srcX and srcY  (carteasean cords); or
2) defining srcR and srcT  (polar cords)
  
   Note that you're free to use any mathematical function listed in Rotating corridor.  If you're studying a deltafield or waveshape; plugging stuff into a graphing calculator will make things much easier!

   Note:  all coordinates in G-Force are such that (0;0) is the center of the G-Force rectangle.  If the ;  the 4 corners are +/- 1; and if  then the aspect ration is forced to 1:1 (and 2 of the 4 corners won't be +/- 1; assuming the G-Force rect isn't a perfect square).  

*/


// When aspc is 0; G-Force will stretch a deltafield to fit a rectangular frame.


/* (.9 * x; .9 * y) is a point 9/10 closer to (0;0) than (x; y).  This causes each frame to suck pixels outward from the center of the frame.  The [rnd( k ) - k/2] part just adds some noise/randomness to smooth things out a little.  */
srcX=.93 * x + rnd( .008 ) - .004;
srcY=.93 * y + rnd( .008 ) - .004;



// This should always equal the version of G-Force they're written for (times one hundred)



/*  Mastered this example?  Scattered Flow Out is an example that uses polar coordinates.  check out Sunburst - Few to see how you can use a variables to make a deltafield different each time it runs.   Finally; see Swirly to see an example that uses d vars.  */
