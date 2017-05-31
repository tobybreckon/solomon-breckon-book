% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
bw=imread('basic_shapes.png');                          %Read in image
[L,num]=bwlabel(bw);                                    %Get labelled image and number of objects
subplot(1,2,1), imagesc(bw); axis image; axis off; 		%Plot binary input image
colorbar('North'); subplot(1,2,2), imagesc(L);          %Display labelled image
axis image; axis off; colormap(jet); colorbar('North')
