% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
load ('c:/chris/warp/ripollbabes.mat')                  %Load images and control point structure
cpselect(rgb2gray(A),rgb2gray(B),cpstruct);         	%Load up the tie points
tform=cp2tform(input_points,base_points,'polynomial');  
                                                        %Infer affine transformation from tie points
C=imtransform(A,tform);                                 %Transform input
subplot(1,2,1), imshow(I),subplot(1,2,2), imshow(C)     %Display
