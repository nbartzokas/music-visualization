  /* config for G-Force Winamp; SoundJam & Macast visual plugin
         made by david Tryse TomteSkogen42@hotmail.com */
 ;
 
  //a0=shrink; a1=horizon; a2=speed
float a0=1.03 + rnd(0.02);
float a1=rnd(2)-0.5;
float a2=0.015 + (rnd(0.07) * rnd(1))*(1+a1);
 
 srcX=x * a0;
 srcY=y + a2 * (a1 + y -1);
 
 
 
