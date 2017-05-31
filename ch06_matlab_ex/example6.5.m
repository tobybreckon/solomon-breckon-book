% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('test_blur.jpg'); 				%Read in image
A=edgetaper(A,ones(25));                %Smooth edges of image
[J,PSF] = deconvblind(A,ones(10)); 		%Deconvolve – initial estimate PSF “flat”
subplot(1,4,1), imshow(A,[]);			%Display original
subplot(1,4,2), imshow(J,[]);			%Display deconvolved

h=fspecial('gaussian',[10 10],3); 
[J,PSF] = deconvblind(A,h); 			%Deconvolve – initial estimate PSF normal
subplot(1,4,3), imshow(J,[]);			%Display 
J = deconvwnr(A,PSF,0.01);              %Wiener filter with “blind” recovered PSF
subplot(1,4,4), imshow(J,[]);			%Display Wiener deconvolution

