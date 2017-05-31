% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=rgb2gray(imread('peppers.png')); % Read in image (in greyscale)
k = fspecial('log', [10 10], 3.0); % create laplacian filter
IEzc = edge(I, 'zerocross', [], k); % zero crossing edges (auto thresholded) 
subplot(1,2,1), imshow(I); % Display image
subplot(1,2,2), imshow(IEzc); % Display image
