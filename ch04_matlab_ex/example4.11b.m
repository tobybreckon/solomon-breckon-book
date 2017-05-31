% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif'); %Read in image
h=fspecial('log', [10 10], 3.0); %Generate 3x3 LoG filter
B=imfilter(A,h); %Filter image with Laplacian kernel
C=imsubtract(A,B); %Subtract Laplacian from original.
subplot(1,3,1), imshow(A);
subplot(1,3,2), imagesc(B); axis image; axis off %Display original, Laplacian and
subplot(1,3,3), imshow(C); %Enhanced image
