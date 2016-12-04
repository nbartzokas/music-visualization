

// G-Force deltaField
// Name: HaL_Weierstrauss_Spread
// created by: Howard a. Landman; 22 april 2001
// e-mail: howard@polyamory.org -or- howard.landman@vitesse.com
// homepage: http://www.polyamory.org/~howard/



// Finite-term approximation to the Weierstrauss function; which is
// the sum of cosine terms which are each continuous and infinitely
// differentiable; but the function itself is nowhere differentiable!
// References:
// G. H. Hardy; Weierstrauss's non-differentiable function;
//   Trans. amer. Math. Soc. 17 (1916) pp.301-325
// Yamaguchi; Hata; & Kigami; Mathematics of Fractals;
//   Translations of Mathematical Monographs v.167 (1993) pp.11-15
// Note: approximating PI as 3 here; but doesn't really matter.
srcY=y  + 0.01*((cos(6*x)/2)+
(cos(12 *x)/ 4)+(cos(24*x)/ 8)+
(cos(48 *x)/16)+(cos(96*x)/32)+
(cos(192*x)/64));

// combine with a simple linear spread in X
srcX=0.993*x;



