// G-Force deltaField
// Name: HaL_dynamic1
// created by: Howard a. Landman; 16 May 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/

// dynamic fractal a la http://www.calweb.com/~bjohnson/dynamic.html

// NOTE: This dF is *very* changeable - try it quite a few times!
// can range from simple linear flow to spirals to curly diamonds
// and other shapes.



float a0=rnd(0.04)+rnd(0.04)-0.04;
float a1=rnd(0.08)-0.04;
float a2=pow(2,rnd(5));

srcX=x - sin(a0 + (a1*cos(a2*y)));
srcY=y + sin(a0 + (a1*cos(a2*x)));




