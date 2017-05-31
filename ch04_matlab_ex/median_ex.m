% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I = imread('trui.png'); % read in image

I = imnoise(I,'salt {\&} pepper', 0.05); % Add impulse noise

h = fspecial('average',[5 5]) ; J=imfilter(J,h); % Apply 5x5 mean filter

K = medfilt2(I,[5 5]); % Apply 5x5 median filter

subplot(1,3,1), imshow(I); subplot(1,3,2), imshow(J); % Display results

subplot(1,3,3), imshow(K);