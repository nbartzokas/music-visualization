/* config for G-Force Winamp; SoundJam & Macast visual plugin made by david Tryse TomteSkogen42@hotmail.com */

//a0=number; a1=power
float a0=8+rnd(10);
float a1=0.01+rnd(0.05);

srcX=x*(0.995-a1+a1*sin(x*a0));
srcY=y*(0.995-a1+a1*sin(y*a0));
 
 
 
