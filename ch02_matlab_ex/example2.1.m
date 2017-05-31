% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('cameraman.tif'); % read in an image
[rows dims]=size(A);	   % get image dimensions
Abuild=zeros(size(A)); 	   % construct zero image of equal size

%Randomly sample 1% of points only and convolve with gaussian PSF

sub=rand(rows.*dims,1)<0.01;
Abuild(sub)=A(sub); h=fspecial('gaussian',[10 10],2);
B10=filter2(h,Abuild); 
subplot(1,2,1), imagesc(Abuild); axis image; axis off;colormap(gray); title('Object points')
subplot(1,2,2), imagesc(B10); axis image; axis off;colormap(gray); title('Response of LSI system')
