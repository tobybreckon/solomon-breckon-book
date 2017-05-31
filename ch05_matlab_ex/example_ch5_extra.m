% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('trui.png');               		%Read in image
PSF= fspecial('gaussian',[5 5],2);  		%Define gaussian convolution kernel
h=fspecial('motion',10,45);          		%define motion filter
B=conv2(PSF,A);                             %Convolve image with convolution kernel 
C=imfilter(A,h,'replicate');                %Convolve motion PSF using alternative function
D=conv2(A,A);                       		%Self Convolution - motion blurred with original
subplot(2,2,1),imshow(A);                   %Display original image
subplot(2,2,2),imshow(B,[]);                %Display filtered image
subplot(2,2,3),imshow(C,[]);        		%Display filtered image
subplot(2,2,4),imshow(D,[]);        		%Display Convolution image with itself (autocorrln)
