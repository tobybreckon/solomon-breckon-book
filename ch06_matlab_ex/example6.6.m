% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A = imread('trui.png'); A=mat2gray(double(A));	%Read in image and convert to intensity
PSF = fspecial('gaussian',7,10);                %Specify PSF
V = .0001;                                      %Define variance of noise
J0 = imnoise(imfilter(A,PSF),'gaussian',0,V);	%Create blurred and noisy image
WT = zeros(size(A));WT(5:end-4,5:end-4) = 1;	%Define weighting function
J1 = deconvlucy(J0,PSF,10);                     %LR deconvolution 10 iterations
J2 = deconvlucy(J0,PSF,20,sqrt(V));             %20 iterations, deviation of noise provided
J3 = deconvlucy(J0,PSF,20,sqrt(V),WT);          %weight function to suppress ringing
subplot(141);imshow(J0);                        %Display various results
subplot(142);imshow(J1);
subplot(143);imshow(J2);
subplot(144);imshow(J3);


