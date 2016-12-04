  /* config for G-Force Winamp; SoundJam & Macast visual plugin
         made by david Tryse TomteSkogen42@hotmail.com */
 
  //a0=out; a1=sinwaves; a2=power
float a0=rnd(0.02)+0.01;
float a1=rnd(60)+10;
float a2=PI/a1*0.8;
 
 srcR=r-a0;
 srcT=theta+a2*(1.3+sin(theta*a1));
 
 
 
