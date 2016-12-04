//do not adjust your sets
//1-26-01
//chris Sherrill
/*I was playing around with a graphing calculator one day when I had the idea to raise y by sin(y); i liked the pattern; so I put it in g-force to see what it would do; it was a bit disapointing; but i thought it was worth expanding the idea. This is how the do not adjust your sets family was born. Now you can enjoy the pleasure of watching untuned chaos you loved on your tv set in music visualization form. ain't that just grand? (hey at least you dont have that annoying buzz noise...)*/


// DO NOT ADJUST YOUR SETS (Modified)
float t0=0.99, t1=0.004, t2=-0.002, t3=0.004;
srcX = t0 * x + ( rand(t1) + t2 );
srcY = rand(t3);
