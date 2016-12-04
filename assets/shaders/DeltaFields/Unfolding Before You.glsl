/*

Thanks to Thomas Geier

Unfolding before You by Jay Protopapas
philodoh@aol.com
*/




float a0=7.5 + trnc(rnd(7.5));
float a1=rnd(.05) - .075;


srcR=r + a1 * cos(theta * a0);
srcT=PI - a1 * cos(r * a0 + 7.5);

