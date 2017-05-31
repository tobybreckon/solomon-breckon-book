% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
Output = immultiply(A,1.5);     % multiple image by 1.5
subplot(1,3,3), imshow(Output); % Display result

Output = imdivide(A,4);         % divide image by 4
subplot(1,3,3), imshow(Output); % Display result
