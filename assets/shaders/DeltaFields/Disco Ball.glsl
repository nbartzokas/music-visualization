// burst by doug Fawley



//a0=size of same-color areas--lower numbers=bigger areas
//a1=speed of pull from outside
//a2=speed of rotation (maybe should be negative; too)
float a0=rnd(10)+15;
float a1=1-rnd(.0001);
float a2=.003+rnd(.003);

srcR=a1*trnc(r*a0)/a0;
srcT=theta - a2;


