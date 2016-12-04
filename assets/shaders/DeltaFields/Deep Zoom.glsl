// DEEP ZOOM (modified)
float a0 = rand(11.0);
float a1 = rand(.004);
float a2 = a1 * pow( a0, 2.0 );
float a3 = pow( pow(a0, 2.5), 2.0 );
srcX = trwv( y * y - x * x + a3 );
srcY = trwv( y * x * 2.5 ) + pow( a2 * y, 2.0 );
srcX = x * (1.0-0.0136719) + srcX * 0.0136719;
srcY = y * (1.0-0.00281692) + srcY * 0.00281692;