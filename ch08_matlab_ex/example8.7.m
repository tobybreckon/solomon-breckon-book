% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('circles.png');                			%Read in binary image
bw=bwperim(A);                          			%Calculate perimeter
se=strel('disk',5); bw1=A-imerode(A,se);            %se allows thick perimeter extraction
subplot(1,3,1), imshow(A);
subplot(1,3,2), imshow(bw);
subplot(1,3,3), imshow(bw1);                         %Display results
