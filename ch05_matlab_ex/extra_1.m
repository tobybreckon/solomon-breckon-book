% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%

f=ones(64,1); f=f./sum(f); 	%Define rectangle signal f and normalise
g=conv(f,f); g=g./sum(g); 	%Convolve f with itself to give g and normalise
h=conv(g,g); h=h./sum(h); 	%Convolve g with itself  to give h and normalise
j=conv(h,h); j=j./sum(j); 	%Convolve h with itself  to give j and normalise

subplot(2,2,1),plot(f,'k-'); axis square; axis off;
subplot(2,2,2),plot(g,'k-'); axis square; axis off;
subplot(2,2,3),plot(h,'k-'); axis square; axis off;
subplot(2,2,4),plot(j,'k-'); axis square; axis off;
