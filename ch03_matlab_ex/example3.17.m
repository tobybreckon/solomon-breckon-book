% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('pout.tif'); % read in image
Ics = imadjust(I,stretchlim(I, [0.05 0.95]),[]); % stretch contrast using method 1
subplot(1,2,1), imshow(I); % display image
subplot(1,2,2), imshow(Ics); % display result
