
// create by brad anderson for G-Force
//e-mail: javalizard@mac.com
//I was really bored one early early Saturday morning after a night of fun and wrote a
//few new delta fields

//Sound of Lights Point and Hang
//sin curve on the x axis of the y



float a0=.02 + rnd(.01);
float a1=2 + rnd(5);

srcX=x + rnd( .002 ) - .001;
srcY=y + a0 * sin(x*a1) + rnd( .002 ) - .001;


