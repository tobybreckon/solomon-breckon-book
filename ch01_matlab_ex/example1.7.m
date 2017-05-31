% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
D=imread('onion.png');      % Read in 8-bit RGB colour image.

Dred  = D(:,:,1);           % extract red channel   (1st channel)
Dgreen = D(:,:,2);          % extract green channel (2nd channel)
Dblue = D(:,:,3);           % extract blue channel  (3rd channel)

subplot(2,2,1); imshow(D); axis image;  % display all in 2x2 plot

subplot(2,2,2); imshow(Dred); title('red');     % display and label      
subplot(2,2,3); imshow(Dgreen); title('green');
subplot(2,2,4); imshow(Dblue); title('blue');