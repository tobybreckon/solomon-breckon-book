% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
B=rand(256).*1000;      % Generate random image array in range 0-1000 

imshow(B);              % Poor contrast results using imshow because data 
                        % exceeds expected range

imagesc(B);             % imagesc automatically scales colourmap to data
axis image; axis off;   % range
colormap(gray); colorbar;

imshow(B,[0 1000]);     % But if we specify range of data explicitly then                    
                        % imshow also displays correct image contrast