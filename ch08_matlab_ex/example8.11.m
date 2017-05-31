% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('open_shapes.png');                                		%read in image
se=strel('disk',10); bw=imopen(A,se);                               %Open with disk radius 10
subplot(1,3,1), imshow(A); title('Original Image');                 %Display original
subplot(1,3,2), imshow(bw); title('Opening - disk radius=10');      %Display opened image
se=strel('square',25); bw=imopen(A,se);                             %open with square side 25
subplot(1,3,3), imshow(bw); title('Opening - square side=25');      %Display opened image
