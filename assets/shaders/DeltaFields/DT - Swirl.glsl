 /* config for G-Force Winamp; SoundJam & Macast visual plugin
         made by david Tryse TomteSkogen42@hotmail.com */
 
  //a0=clockwise?; a1=swirlpower; a2=power
float a0=sgn(rnd(2)-1);
float a1=7+rnd(13);
float a2=0.05 + rnd(.8);

 srcR=r + a2 * (0.006*pow(1-0.7*r,3)+0.005);
 srcT=theta + a0 * a2 * ((0.4+0.03*a1)*pow(1-0.7*r,a1)-0.02);
 
 
 
