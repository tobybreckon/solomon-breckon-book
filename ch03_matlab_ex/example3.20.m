% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('pout.tif');
pz=0:255; % Define ramp-like pdf as desired output histogram
Im=histeq(I, pz); % supply desired histogram to perform matching

subplot(2,3,1), imshow(I); % display image
subplot(2,3,2), imshow(Im); % display result
subplot(2,3,3), plot(pz); % display distribution t
subplot(2,3,4), imhist(I); % display hist. of image
subplot(2,3,5), imhist(Im); % display hist. of result
