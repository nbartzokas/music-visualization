/*                                                     */
/* ONE   v1.1                                          */
/*   Paint on acid                                     */
/*                                                     */
/* by Steve Steve Wheeler                              */
/*  E-mail: stevewheeler@mac.com                       */

// (modified)

float
o0 = 0.0,
o1 = .6,
o2 = 0.0,
o3 = .15,
o4 = 1.6 + sin( time/1.0 )/1.0,
o5 = 0.0,
o6 = 1.5 + sin( time/1.0 )/1.0,
o7 = 1.5 + cos( time/1.0 )/1.0;
srcR = sin( o0 * r ) / o1;
srcT = theta - ( ( r - o2 ) * rnd( o3 ) ) ;
srcR = r * o4 + srcR * o5;
srcT = theta * o6 + srcT * o7;



