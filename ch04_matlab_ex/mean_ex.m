% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%

A=imread('text.tif'); % Read in imageh1=fspecial('average'); 
h2=fspecial('average',[5 5]); 

h3=fspecial('average',[5 2]); % Define 3 averaging filters

subplot(1,4,1); imagesc(A); axis image; axis off; colormap(gray); % Display original image

B=filter2(h1,A); % Apply 1$^{st}$ filter

subplot(1,4,2); imagesc(B); axis image; axis off; colormap(gray); % Display filtered image

B=filter2(h2,A); % Apply 2$^{nd}$ filter

subplot(1,4,3); imagesc(B); axis image; axis off; colormap(gray); % Display filtered image

B=filter2(h3,A); % Apply 3$^{rd}$ filter

subplot(1,4,4); imagesc(B); axis image; axis off; colormap(gray); % Display filtered image
