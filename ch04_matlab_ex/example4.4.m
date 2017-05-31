% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
k = ones(3,3) / 9;	% define mean filter
I_m = imfilter(I,k); % apply to original image
Isp_m = imfilter(Isp,k); % apply to salt and pepper image
Ig_m = imfilter(Ig,k); % apply tp gaussian image
subplot(1,3,1), imshow(I_m); % Display result image 
subplot(1,3,2), imshow(Isp_m); % Display result image
subplot(1,3,3), imshow(Ig_m); % Display result image
