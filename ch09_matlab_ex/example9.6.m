% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('aeroplane_silhouette.png');                           %Read in image and convert to grey scale
bw=~im2bw(A,0.5);                                               %Threshold and invert
subplot(1,2,1), imshow(bw,[]);                                  %Display
[y,x]=find(bw>0.5);                                             %get coordinates of non-zero pixels
centroid=mean([x y]);                                           %Get (centroid) of data 
hold on; plot(centroid(1),centroid(2),'rd');                  	%Plot shape centroid
C=cov([x y]);                                                   %calculate covariance of coordinates
[U,S]=eig(C)                                                    %Find principal axes and eigenvalues
                                                                %Plot the principal axes
m=U(2,1)./U(1,1);                                                     	
const=centroid(2)-m.*centroid(1);
xl=50:450; yl=m.*xl+const
subplot(1,2,2), imshow(bw,[]); h=line(xl,yl);                   %Display.......
set(h,'Color',[1 0 0],'LineWidth',2.0)
m2=U(2,2)./U(1,2);
const=centroid(2)-m2.*centroid(1);
x2=50:450; y2=m2.*x2+const
h=line(x2,y2); set(h,'Color',[1 0 0],'LineWidth',2.0)
