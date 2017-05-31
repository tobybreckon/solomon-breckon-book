% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('coins_and_key.png'); subplot(1,2,1), imshow(A);       %Read in image and display
bw=~im2bw(rgb2gray(A),0.35);  bw=imfill(bw,'holes');    		%Threshold and fill in holes
bw=imopen(bw,ones(5)); subplot(1,2,2), imshow(bw,[0 1]);		%Morphological opening 
[L,num]=bwlabel(bw);                                    		%Create labelled image
s=regionprops(L,'area','perimeter');                    		%Calculate region properties
for i=1:num                                             		%object’s area and perimeter     
x(i)=s(i).Area;
y(i)=s(i).Perimeter;
form(i)=4.*pi.*x(i)./(y(i).^2);                         		%Calculate form factor
end
figure; plot(x./max(x),form,'ro');                      		%Plot area against form factor

