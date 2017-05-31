% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('pout.tif'); % read in image
Ieq=histeq(I);
subplot(2,2,1), imshow(I); % display image
subplot(2,2,2), imshow(Ieq); % display result
subplot(2,2,3), imhist(I); % display hist. of image
subplot(2,2,4), imhist(Ieq); % display hist. of result
