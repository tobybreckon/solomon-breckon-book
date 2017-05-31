% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('autumn.tif'); % Read in image
Ihsv=rgb2hsv(I); % Convert original to HSV image, I2
V=histeq(Ihsv(:,:,3)); % Histogram equalise V (3rd) channel of I2
Ihsv(:,:,3)=V; % Copy equalised V plane into (3rd) channel I2
Iout=hsv2rgb(Ihsv); % Convert I2 back to RGB form
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(Iout);
