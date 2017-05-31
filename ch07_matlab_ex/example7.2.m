% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
clear;                                   %Clear variables 
A = imread('plate_side.jpg');            %Read image to be registered
figure, imshow(A);                       %Display
[x,y]=ginput(4); input_points=[x y];     %Interactively define coords 
                                         %of input quadrilateral
figure, imshow('plate_reference.jpg')    %Read base reference)image.
[x,y]=ginput(4); base_points=[x y];      %Interactively define coords             
                                         %of base quadrilateral
t_carplate = cp2tform(input_points,base_points,'projective');    
                                         %Create projective  
                                         %transformation structure.
registered = imtransform(A,t_carplate);  %Apply projective transform 
B=imcrop(registered);                    %Interactively crop result
figure, imshow(B)                        %Display corrected image
