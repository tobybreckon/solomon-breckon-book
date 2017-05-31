% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
rgb = imread('pears.png');         % Step 1. Read image and 
I = rgb2gray(rgb);                 % use the Gradient Magnitude as 
subplot(1,3,1), imshow(I)		   % the basic segmentation Function
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);

se = strel('disk', 20);				% Step 2. Mark the Foreground Objects using 
Ie = imerode(I, se);				% morphological techniques called 
Iobr = imreconstruct(Ie, I);		% "opening-by-reconstruction" and 
subplot(1,3,2), imshow(Iobr),		% "closing-by-reconstruction" to "clean" 
									% up the image.  These operations will 
									% create flat maxima inside each object 
									% that can be located using imregionalmax.
   
Iobrd = imdilate(Iobr, se);			% Following the opening with a closing 
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));

Iobrcbr = imcomplement(Iobrcbr);    % to remove the dark spots and stem marks. 
subplot(1,3,3); imshow(Iobrcbr);    % Notice you must complement the image 
									% inputs and output of imreconstruct.

fgm = imregionalmax(Iobrcbr);       % Calculate the regional maxima of Iobrcbr 
									% to obtain good foreground markers.
									
I2 = I; I2(fgm) = 255;				% To help interpret the result, superimpose 
figure; subplot(1,3,1); imshow(I2);	% these foreground marker image on the 
									% original image.

se2 = strel(ones(5,5));				% Some of the mostly-occluded and shadowed 
fgm2 = imclose(fgm, se2);			% objects are not marked, which means that 
fgm3 = imerode(fgm2, se2);			% these objects will not be segmented
									% properly in the end result.  Also, the 
									% foreground markers in some objects go 
									% right up to the objects' edge.  That means 
									% we must clean the edges of the marker 
									% blobs and then shrink them a bit. 
									 
fgm4 = bwareaopen(fgm3, 20);		% This procedure leaves some stray isolated  
I3 = I; I3(fgm4) = 255;				% pixels that must be removed.  Do this 
subplot(1,3,2), imshow(I3);			% using bwareaopen, which removes all blobs 
									% that have fewer than a certain number of 
									% pixels.
									
									

bw = im2bw(Iobrcbr, graythresh(Iobrcbr)); %Step 3: Compute Background Markers
subplot(1,3,3), imshow(bw);			% Now we need to mark the background.  In 
									% the cleaned-up image, Iobrcbr, the 
									% dark pixels belong to the background, 
									% so you could start with a thresholding 
									% operation.
									
D = bwdist(bw);						% The background pixels are in black, 
DL = watershed(D);					% but ideally we don't want the background 
bgm = DL == 0;						% markers to be too close to the edges of 
figure; subplot(1,3,1);imshow(bgm); % the objects we are trying to segment.  
									% We'll "thin" the background by computing 
									% the "skeleton by influence zones", or SKIZ, 
									% of the foreground of bw. This can be done 
									% by computing the watershed transform of the 
									% distance transform of bw, and 
									% then looking for the watershed ridge 
									% lines (DL == 0) of the result.



gradmag2 = imimposemin(gradmag, bgm | fgm4); % Step 4: Compute the modified  
									% segmentation function.
									% The function imimposemin is used to modify 
									% an image so that it has regional minima 
									% only in certain desired locations.  
									% Here you can use imimposemin to modify 
									% the gradient magnitude image so that its 
									% regional minima occur at foreground and 
									% background marker pixels.

L = watershed(gradmag2);   			% Step 5: Now compute the Watershed 
									% Transform of modified function

% A useful visualization technique is to display the label matrix L as a color 
% image using label2rgb. We can then superimpose this pseudo-color label 
% matrix on top of the original intensity image.

Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');
subplot(1,3,2),imshow(Lrgb)
subplot(1,3,3),imshow(I), hold on
himage = imshow(Lrgb); set(himage, 'AlphaData', 0.3);

    



