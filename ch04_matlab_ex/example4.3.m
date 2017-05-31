% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('eight.tif'); % Read in image
subplot(1,3,1), imshow(I); % Display image
Isp = imnoise(I,'salt & pepper',0.03); % add 3% (0.03) salt and pepper noise
subplot(1,3,2), imshow(Isp); % Display result image Isp
Ig = imnoise(I,'gaussian',0.02); % add Gaussian noise (with 0.02 variance)
subplot(1,3,3), imshow(Ig); % Display result image Ig
