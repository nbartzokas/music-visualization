// create by brad anderson for G-Force
//e-mail: javalizard@mac.com
//This one was a procrastination from class; :P

//Sound of Lights Waves
//Looks like a reflection in the waves...  or from underneath the ocean?
// + (cos(((y+1)^2.7) * 10) + 1.5) / 40


srcX=x - .4 * (sin(( pow( (x+2+(.15 * sin(5 * r))),1.7 ) ) * 10) + 1.5) / 20;
srcY=y - .4 * (cos(( pow( (y+2+(.15 * cos(5 * r))),2.7 ) ) * 10) + 1.5) / 40;


