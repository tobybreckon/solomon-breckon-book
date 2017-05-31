% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I = checkerboard(20,4);                             %Read in image
%I = imread('trui.png');                    		%Repeat afterwards for this image
[nrows,ncols] = size(I);                    		%Extract no. of cols and rows
[xi,yi] = meshgrid(1:ncols,1:nrows);        		%Define grid

imid = round(size(I,2)/2);                  		% Find index of middle element
xt = xi(:) - imid;                          		%Subtract off and thus
yt = yi(:) - imid;                          		%shift origin to centre
[theta,r] = cart2pol(xt,yt);                		%Convert from cartesian to polar
a = .0005;                                  		%Set the amplitude of the cubic term.
s = r + a.*r.^3;                             		%calculate BARREL distortion 
[ut,vt] = pol2cart(theta,s);               		 	%Return the (distorted)cartesian coordinates
u = reshape(ut,size(xi)) + imid;            		%reshape the coordinates to original 2-D grid  
v = reshape(vt,size(yi)) + imid;                    %reshape the coordinates into original 2-D grid 
tmap_B = cat(3,u,v);                        		%Assign u and v grids as the 2 planes of a 3-D array
resamp = makeresampler('linear','fill');    
I_barrel = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,.3);


[theta,r] = cart2pol(xt,yt);                		%Convert from cartesian to polar
a=-0.000015;                                  		%Set amplitude of cubic term
s = r + a.*r.^3;                            		%calculate PINCUSHION distortion 
[ut,vt] = pol2cart(theta,s);                		%Return the (distorted)cartesian coordinates
u = reshape(ut,size(xi)) + imid;                    %reshape the coordinates into original 2-D grid  
v = reshape(vt,size(yi)) + imid;                    %reshape the coordinates into original 2-D grid 
tmap_B = cat(3,u,v);                        		%Assign u and v grids as the 2 planes of a 3-D array
resamp = makeresampler('linear','fill');            %Define resampling structure for use with tformarray
I_pin = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,.3);
                                            		%Transform image to conform to grid in tmap_B                                            
subplot(131); imshow(I); 	subplot(1,3,2), imshow(I_barrel); 
subplot(1,3,3), imshow(I_pin); 
