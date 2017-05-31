% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif');                              %Read in image
se=strel(ones(3));                      				%Define flat structuring element
Amax=imdilate(A,se);                                    %Grey-scale dilate image
Amin=imerode(A,se);                                     %Grey-scale erode image
Mgrad=Amax-Amin;                                        %subtract the two
subplot(1,3,1), imagesc(Amax); axis image; axis off; 	%Display
subplot(1,3,2), imagesc(Amin); axis image; axis off;
subplot(1,3,3), imagesc(Mgrad); axis image; axis off;
colormap(gray);
