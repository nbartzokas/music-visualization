/* 

In his novel Mere_christianity; c.S. Lewis writes:
   a man who was merely a man and said the sort of things Jesus said would not be a great moral teacher. He would either be a lunatic - on the level with a man who says he is a poached egg - or he would be the devil of hell. You must take your choice. Either this was; and is; the Son of God; or else a madman or something worse. You can shut Him up for a fool or you can fall at His feet and call Him Lord and God. but let us not come with any patronizing nonsense about His being a great human teacher. He has not left that open to us.

    There's many good sites; but http://www.ccci.org/whoisjesus/interactive-journey/ is a good site that can introduce you to what being a christian is really all about.  

*/

// There's a 1 in 25 chance a0 will evaluate to be .015; otherwise; it's 0
float a0=.015 * ( 1 - clip( flor( rnd( 25 ) ) ) );
float d0=clip( sqwv(x * 10) * sqwv(y * 1.5) + sqwv(x * 2) * sqwv(( y - .25 ) * 10) ) * a0 + .985;
srcX=x * d0;
srcY=y * d0;


