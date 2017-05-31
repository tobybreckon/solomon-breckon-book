% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('openclose_shapes.png'); A=~logical(A);            %Read in image and convert to binary
se=strel('disk',3); bw1=imopen(A,se); bw2=imclose(A,se);	%Define SEs then open and close
subplot(3,2,1), imshow(bw1); subplot(3,2,2), imshow(bw2);	%Display results
se=strel('disk',6); bw1=imopen(A,se); bw2=imclose(A,se);	%Define SEs then open and close
subplot(3,2,3), imshow(bw1); subplot(3,2,4), imshow(bw2);	%Display results
se=strel('disk',15); bw1=imopen(A,se); bw2=imclose(A,se);	%Define SEs then open and close
subplot(3,2,5), imshow(bw1); subplot(3,2,6), imshow(bw2);	%Display results

