% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('firstimage.jpg');  % Read in 1st image
B=imread('secondimage.jpg'); % Read in 2nd image

subplot(1,3,1), imshow(A); % Display 1st image 
subplot(1,3,2), imshow(B); % Display 2nd image

Output = imsubtract(A, B); % subtract images

subplot(1,3,3), imshow(Output); % Display result
