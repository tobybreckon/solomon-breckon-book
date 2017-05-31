% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
mask=~imread('shakespeare.pbm');                %Read in binary text                                         
mask=imclose(mask,ones(5));             		%Close to bridge breaks in letters
se=strel('line',40,90);                			%Define vertical se length 40
marker=imerode(mask,se);                		%Erode to eliminate characters  
im=imreconstruct(marker,mask);          		%Reconstruct image
subplot(3,1,1), imshow(~mask); title('Original mask Image');
subplot(3,1,2), imshow(~marker); title('marker image');
subplot(3,1,3), imshow(~im); title('Opening by reconstruction');
