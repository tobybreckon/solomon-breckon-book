% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
Iorig=imread('cameraman.tif');  %Read in image
g=fspecial('gaussian',[5 5],1.5); %Generate gaussian kernel
subplot(2,3,1), imshow(Iorig);  %Display original image
Is=imfilter(Iorig,g); 		%Create smoothed image by filtering
Ie=(Iorig - Is); 			%Get difference image
subplot(2,3,2), imshow(Ie); %Display unsharp difference

Iout=Iorig+(0.3).*Ie; %Add k * difference image to original
subplot(2,3,3),  imshow(Iout);
Iout=Iorig+(0.5).*Ie; %Add k * difference image to original
subplot(2,3,4),  imshow(Iout);
Iout=Iorig+(0.7).*Ie; %Add k * difference image to original
subplot(2,3,5),  imshow(Iout);
Iout=Iorig+(2.0).*Ie; %Add k * difference image to original
subplot(2,3,6),  imshow(Iout);
