% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('rice.png'); % read in image
Im=imfilter(I,fspecial('average',[15 15]),'replicate'); % create mean image
It = I - (Im + 20); % subtract mean image (+ constant C=20)
Ibw=im2bw(It,0);    % threshold result at 0 (keep +ve results only)
subplot(1,2,1), imshow(I); % Display image
subplot(1,2,2), imshow(Ibw); % Display result

