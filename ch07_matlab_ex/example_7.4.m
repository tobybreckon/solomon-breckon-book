% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('cameraman.tif');                          %Read in image
cpstruct=cpselect(I,I);                             %Mark the tie points and save within gui
                                                    %Gives input_points and output_points
tform=cp2tform(input_points,base_points,'affine');  %Infer affine transformation from tie points
B=imtransform(I,tform);                             %Transform input
subplot(1,2,1), imshow(I),subplot(1,2,2), imshow(B)	%Display

