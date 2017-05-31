% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=double(imread('cameraman.tif')); %Read in image
h=fspecial('laplacian'); %Generate 3x3 Laplacian filter
B=imfilter(double(A),h); %Filter image with Laplacian kernel
C=imsubtract(A,B); %Subtract Laplacian from original.
subplot(1,3,1), imagesc(A); colormap('gray'); %Display original, Laplacian and
subplot(1,3,2), imagesc(B);  colormap('gray'); %Enhanced image
axis image; axis off
subplot(1,3,3), imagesc(C);
