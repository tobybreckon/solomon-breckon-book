% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I = imread('pout.tif');  % read in image
I1 = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
I2 = adapthisteq(I,'clipLimit',0.02,'Distribution','exponential');
I3 = adapthisteq(I,'clipLimit',0.08,'Distribution','uniform');
subplot(2,2,1), imshow(I); subplot(2,2,2), imshow(I2); % diplay orig. + output
subplot(2,2,3), imshow(I2); subplot(2,2,4), imshow(I3); % diplay outputs
