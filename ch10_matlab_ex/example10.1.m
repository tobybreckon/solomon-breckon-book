% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I = imread('coins.png');                                %Read in original
subplot(2,2,1), imshow(I);                      		%Display original
subplot(2,2,2),im2bw(I,0.35);                   		%result of manual threshold
[counts,X]=imhist(I);                           		%calculate image hIstogram
P = polyfit(X,counts,6); Y=polyval(P,X);        		%Fit to histogram and evaluate
[V,ind]=sort(abs(diff(Y))); thresh=ind(3)./255; 		%Find minimum of polynomial
subplot(2,2,3), im2bw(I,thresh);                		%result of Polynomial theshold
level = graythresh(I);                                  
subplot(2,2,4), im2bw(I,level);                 		%result of Otsu's method 
 
figure; plot(X,counts); hold on, plot(X,Y,'r-');		%histogram and polynomial fit
