% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
center1 = -10;                                  %Create artificial image.....
center2 = -center1;
dist = sqrt(2*(2*center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2) <= radius;
bw = bw1 | bw2;

D = bwdist(~bw);                                %Calculate basic segmentation function
                                                %(Euclidean distance transform of 	~bw)
subplot(2,2,1), imshow(bw,[]);                  %Display image
subplot(2,2,2), imshow(D,[]);                   %Display basic segmentation function
                                                %Modify segmentation function
D = -D;                                 		%invert and set background pixels lower than all catchment basin minima
D(~bw) = -inf;                                  %
subplot(2,2,3), imshow(D,[]);                   %Display modified segmentation image
L = watershed(D);   subplot(2,2,4), Imagesc(L); %calculate watershed of segmentation function
axis image; axis off; colormap(hot); colorbar	%Display labelled image - colour coded

A=imread('overlapping_euros1.png');     		%Read in image
bw=im2bw(A,graythresh(A));              		%Threshold automatically
se=strel('disk',10); bwo=imopen(bw,se); 		%Remove background by opening
D = bwdist(~bwo);                       		%Calculate basic segmentation function
D = -D; D(~bwo) = -255;                 		%invert, set background lower than catchment basin minima
L = watershed(D);                       		%calculate watershed

figure, subplot(1,4,1), imshow(A);              %Display original
subplot(1,4,2), imshow(bw)              		%Thresholded image
subplot(1,4,3), imshow(D,[]);           		%Display basic segmentation function
ind=find(L==0); Ac=A; Ac(ind)=0;        		%Identify watersheds and set=0 on original
subplot(1,4,4), imshow(Ac,[]); hold on     		%Segmentation superimposed on original
%Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');     		%calculate label image
%himage = imshow(Lrgb); set(himage, 'AlphaData', 0.3);   %Superimpose transparently on original
