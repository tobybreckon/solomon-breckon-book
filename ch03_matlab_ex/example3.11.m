% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif'); % Read in image

subplot(1,2,1), imshow(A); % Display image

B=imadjust(A,[0 1],[0 1],1./3); % Map input grey values of image A in range 0-1 to an 

% output range of 0-1 with gamma factor of 1/3 (i.e. r = 3). 

% Type $>>$ doc imadjust for details of possible syntaxes

subplot(1,2,2), imshow(B); % Display result.