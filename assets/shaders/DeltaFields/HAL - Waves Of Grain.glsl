// G-Force deltaField
// Name: HaL_Waves_Of_Grain
// created by: Howard a. Landman; 18 July 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/



float a0=0.7+rnd(9)+rnd(1);   // larger a0 => finer texture
float a1=(0.1+rnd(0.6))/(a0+rnd(1));  // degree of bernoulli-ness
                          // larger a1 => more chaotic
float a2=rnd(0.07)-rnd(0.01); // speed of wind
float a3=rnd(2*PI);           // direction of wind
float a4=a2*cos(a3);          // X component of wind
float a5=a2*sin(a3);          // Y component of wind

srcX=x + a1*(2*wrap(a0*(x+y))-1) + a4;
srcY=y + a1*(2*wrap(a0*(y-x))-1) + a5;

// don't ask me to explain this one.
//
// I started off with the idea that a constant flow might
// work better with the bernoulli map than a 0.98*x
// kind of flow.  but straight right-left or up-down was boring;
// so I tried to rotate 45 degrees.
//
// basically there's a diagonal multi-bernoulli map in each direction;
// but there was a lot of trial and error to get the bounds
// a0 and a1 approximately right for interesting effects.
//
// can look smoky; spongy; stippled; foresty; tiled; feathery; ... ?




