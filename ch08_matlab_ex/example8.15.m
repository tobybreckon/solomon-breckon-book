% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I = imread('rice.png');                             %Read in image
background = imopen(I,strel('disk',15));			%Opening to estimate background
I2 = imsubtract(I,background);                      %subtract background
I3 = imadjust(I2);                                  %Improve contrast
subplot(1,4,1), imshow(I);subplot(1,4,2), imshow(background);
subplot(1,4,3), imshow(I2);subplot(1,4,4), imshow(I3);
