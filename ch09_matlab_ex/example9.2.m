% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('spain.png'); iberia=logical(A);               %Read in image convert to binary
ibbig=imdilate(iberia,ones(3)); bound=ibbig-iberia;     %calculate boundary pixels
[i,j]=find(bound>0); xcent=mean(j); ycent=mean(i);      %Calculate centroid
hold on; plot(xcent,ycent,'ro');

subplot(4,2,1),imagesc(bound); axis image; axis on; colormap(gray);  %Plot perimeter
[th,r]=cart2pol(j-xcent,i-ycent);                       %Convert to polar coordinates
subplot(4,2,2); plot(th,r,'k.'); grid on; axis off;     %Plot signature

                                                        %Calculate Fourier series of boundary                                                        %series of boundary 
N=0;L=2.*pi;f=r;M=length(f);                            %N=0 - DC term only
[a,b,dc]=fseries_1D(f,L,N) ;                            %Calculate expansion coeffs
fapprox=fbuild_1D(a,b,dc,M,L);                          %Build approximate function using the coeffs
[x,y]=pol2cart(th,fapprox); 
x=x+xcent; x=x-min(x)+1; y=y+ycent; y=y-min(y)+1;       %Convert back to cartesian coordinates
prm=zeros(round(max(y)),round(max(x))); i=sub2ind(size(prm),round(y),round(x)); prm(i)=1;
subplot(4,2,3); imagesc(prm); axis image; axis ij; axis on; colormap(gray); %Display resulting 2D boundary
subplot(4,2,4); plot(th,fapprox,'k.'); axis off;        %Display corresponding signature
s=sprintf('Approximation %d terms',N); title(s);

N=5;L=2.*pi;f=r;M=length(f);                            %Repeat for N=5 terms
[a,b,dc]=fseries_1D(f,L,N) ;                            %Calculate expansion coeffs
fapprox=fbuild_1D(a,b,dc,M,L);                          %Build approximate function using the coeffs
[x,y]=pol2cart(th,fapprox); 
x=x+xcent; x=x-min(x)+1; y=y+ycent; y=y-min(y)+1; 
prm=zeros(round(max(y)),round(max(x))); i=sub2ind(size(prm),round(y),round(x)); prm(i)=1;
subplot(4,2,5); imagesc(prm); axis image; axis ij; axis off; colormap(gray);   %Display resulting 2D boundary
subplot(4,2,6); plot(th,fapprox,'k.'); axis off;        %Display corresponding signature
s=sprintf('Approximation %d terms',N); title(s);

N=15;L=2.*pi;f=r;M=length(f);                           %Repeat for N=15 terms
[a,b,dc]=fseries_1D(f,L,N) ;                            %Calculate expansion coeffs
fapprox=fbuild_1D(a,b,dc,M,L);                          %Build approximate function using the coeffs
%Convert back to cartesian coordinates
[x,y]=pol2cart(th,fapprox); 
x=x+xcent; x=x-min(x)+1; y=y+ycent; y=y-min(y)+1; 
prm=zeros(round(max(y))+10,round(max(x))+10); i=sub2ind(size(prm),round(y),round(x)); prm(i)=1;
subplot(4,2,7); imagesc(prm); axis image; axis ij; axis off; colormap(gray);    %Display resulting 2D boundary
subplot(4,2,8); plot(th,fapprox,'k.'); axis off;        %Display corresponding signature
s=sprintf('Approximation %d terms',N); title(s);



