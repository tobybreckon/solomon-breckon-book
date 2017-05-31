% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif'); % Read in image
subplot(1,2,1), imshow(A); % Display image
func = @(x) max(x(:)); % set filter to apply
B = nlfilter(A,[3 3],func); % apply over 3 x 3 neighbourhood
subplot(1,2,2), imshow(B); % Display result image B
