% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif');      % Read in intensity image


subplot(2,2,1); imshow(A);      % First display image using imshow

subplot(2,2,2); imagesc(A);     % Next display image using imagesc

axis image;                     % Correct aspect ratio of displayed image
axis off;                       % turn off the axis labelling
colormap(gray);                 % display intensity image in gray-scale

% errata corrected - 19/3/16 TPB