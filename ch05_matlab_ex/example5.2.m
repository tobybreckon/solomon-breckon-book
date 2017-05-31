% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif');                         		%Read in image
FT=fft2(A); FT_centred=fftshift(FT);                    %take FT, get centred version too
subplot(2,3,1), imshow(A);                          	%Display image
subplot(2,3,2), imshow(log(1+abs(FT)),[]);          	%Display FT modulus (log scale)
subplot(2,3,3), imshow(log(1+abs(FT_centred)),[]);      %Display centred FT modulus(log scale)
 
Im1=abs(ifft2(FT)); subplot(2,3,5), imshow(Im1,[]); 	%Inverse FFT and display
Im2=abs(ifft2(FT_centred)); subplot(2,3,6), imshow(Im1,[]); %Inverse FFT and display
 
figure;
[xd,yd]=size(A); x=-xd./2:xd./2-1; y=-yd./2:yd./2-1;
[X,Y]=meshgrid(x,y); sigma=32; 
arg=(X.^2+Y.^2)./sigma.^2; frqfilt=exp(-arg);       	%Construct freq domain filter
imfilt1=abs(ifft2(frqfilt.*FT));                    	% Centred filter & non-centred spectrum
imfilt2=abs(ifft2(frqfilt.*FT_centred));            	%image - Centred filter on centred spectrum
subplot(1,3,1), imshow(frqfilt,[]);                 	%Display results
subplot(1,3,2), imshow(imfilt1,[]); 
subplot(1,3,3), imshow(imfilt2,[]); 
