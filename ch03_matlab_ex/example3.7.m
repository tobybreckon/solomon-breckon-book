% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('trees.tif');  % Read in 1st image
T=im2bw(I, 0.1); % perform thresholding
subplot(1,3,1), imshow(I); % Display original image 
subplot(1,3,2), imshow(T); % Display thresholded image
