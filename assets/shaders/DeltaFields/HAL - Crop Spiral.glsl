// G-Force deltaField
// Name: HaL_crop_Spiral
// created by: Howard a. Landman; 20-28 July 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/



float a0=0.5+rnd(7)+rnd(1);       // larger a0 => finer texture
float a1=0.010+rnd(0.03);         // degree of bernoulli-ness
                              // larger a1 => more chaotic
float a2=rnd(0.04)+rnd(0.02)+a1;  // speed of wind
float a3=rnd(2*PI);               // direction of wind
float a4=a2*cos(a3)*0.7 - 0.005;  // R component of wind; toned down a bit
                              // & biased to outward flow a little
                              // since that fills up the screen better
float a5=a2*sin(a3)*0.9;          // T component of wind; toned down a bit
float a6=rnd(1);                  // How much does a4 multiply vs add?
                              // That is; is the radial flow more like
                              // srcR = 0.99*r flow or srcR = r - 0.01?
float a7=(1+a6*a4);               // precompute (radial multiplier)
float a8=(1-a6)*a4;               // precompute (radial adder)

srcR=r*a7 +  a1*(2*wrap(a0*(r+theta))-1) + a8;
srcT=theta + a1*(2*wrap(a0*(theta-r))-1) + a5;

// a r-t version of HaL_Grain.
// also similar to HaL_crop_circle.




