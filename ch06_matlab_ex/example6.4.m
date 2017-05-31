% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I = imread('trui.png');                                     %Read in image
PSF = fspecial('gaussian',7,10);                            %Define PSF
V = .01;                                                    %Specify noise level
BlurredNoisy = imnoise(imfilter(I,PSF),'gaussian',0,V);     %Produce noisy blurred image
NP = V.*prod(size(I));                                      %Calculate noise power
[J LAGRA_J] = deconvreg(BlurredNoisy,PSF,NP);               %Constrained deconvolution - %default Laplacian operator,Lagrange                                                          % multiplier optimised
[K LAGRA_K] = deconvreg(BlurredNoisy,PSF,[],LAGRA_J*10);	%Lagrange multiplier fixed (10 times larger)
subplot(131);imshow(BlurredNoisy);                          %Display original
subplot(132);imshow(J);                                     %Display 1st deconvolution result	
subplot(133);imshow(K);                                     %Display 2nd deconvolution result

