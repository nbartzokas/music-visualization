// UFO by demonseed
// based on:
// direct X Expand - Y



// Randomly chose a grainularity/noise offset to source point.
float a0=rnd( .0045 );

// Randomly choose the scale of outflow
float a1=-1*(.10 + rnd( .06 ));

// choose a random rotation factor
float a2=.003 + rnd( .006 );


srcR=( .99 - a1 * ( pow(abs( y ), 1.3) ) ) * r - rnd( a0 );
srcT=theta + a2;


