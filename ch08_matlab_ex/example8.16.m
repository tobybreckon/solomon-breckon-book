% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A = imread('rice.png');             	%Read in unevenly illuminated image
se = strel('disk',12);              	%Define structuring element
Atophat = imtophat(A,se);               %Apply tophat filter
subplot(1,3,1), imshow(A);          	%Display Original
subplot(1,3,2), imshow(Atophat)     	%Display raw filtered image
B = imadjust(Atophat);                  %Contrast adjust filtered image
subplot(1,3,3), imshow(B);          	%Display filtered and adjusted mage
