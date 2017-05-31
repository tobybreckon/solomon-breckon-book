% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('zener_star.jpg'); I=double(rgb2gray(I));              %Read in image and convert to intensity
wdth=5; sdvn=2;                                                 %Fix smoothing parameters
k=0.04;                                             			%Fix Harris constant
hsmall=fspecial('gaussian',[wdth wdth],sdvn);                   %Define gaussian filter
[Fx,Fy]=gradient(I);                                            %Calculate gradient
Fx_sq=Fx.^2; Fy_sq=Fy.^2; Fx_Fy=Fx.*Fy;                         %Define terms in Harris function
Fx_sq=filter2(hsmall,Fx_sq);                        			%Perform neighbourhood smoothing
Fy_sq=filter2(hsmall,Fy_sq);                        			%on each term
Fx_Fy=filter2(hsmall,Fx_Fy);
                                                                %calculate Harris function
R=(1-2.*k).*Fx_sq.*Fy_sq - k.*(Fx_sq.^2+Fy_sq.^2) - Fx_Fy.^2;

S=ordfilt2(R,wdth.^2,ones(wdth));                               %Maximum filtering over neighbourhood
[j,k]=find(R>max(R(:))./12 & R==S);                             %Get subscript indices of local maxima
subplot(1,2,1), imagesc(R); axis image; axis off; colormap(gray);%Display Harris response
subplot(1,2,2), imshow(I,[]);                       			%Display original image
hold on; plot(k,j,'r*');                            			%Interest points superimposed
bw=zeros(size(R)); bw([j,k])=1; bw=logical(bw);                 %Return logical array of interest locations
