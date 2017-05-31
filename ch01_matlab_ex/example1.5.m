% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
B=imread('cell.tif');       % Read in 8-bit intensity image of cell

imshow(B);                  % examine grayscale image in interactive viewer

D=imread('onion.png');      % Read in 8-bit colour image.

imshow(B);                  % examine RGB image in interactive viewer

B(25,50)                    % print pixel value at location (25,50)
B(25,50) = 255;             % set pixel value at (25,50) to white
imshow(B);                  % view resulting changes in image

D(25,50, :)                     % print RGB pixel value at location (25,50)
D(25,50, 1)                     % print only the red value at (25,50)
D(25,50, :) = [255, 255, 255];  % set pixel value to RGB white
imshow(D);                      % view resulting changes in image

% errata corrected - 19/3/16 TPB