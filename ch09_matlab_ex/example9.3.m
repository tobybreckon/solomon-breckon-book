% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=rgb2gray(imread('spanners.png'));     %Read in image, convert to grey
bwin=~im2bw(A,0.5);                     %Threshold and display
[L,num]=bwlabel(bwin);                  %Create labelled image
subplot(2,2,1), imshow(A);              %Display input image          

for i=1:num                             %Loop through each labelled object
I=zeros(size(A));                       %array for ith object
ind=find(L==i); I(ind)=1;               %Find pixels belonging to ith object and set=1
subplot(2,2,i+1), imshow(I);            %Display identified object

[rows,cols]=size(I); x=1:cols;y=1:rows; %get indices
[X,Y]=meshgrid(x,y);                    %Set up grid for calculation

                                        %calculate required ordinary moments
M_00=sum(sum(I));                       
M_10=sum(sum(X.*I)); M_01=sum(sum(Y.*I));
xav=M_10./M_00; yav=M_01./M_00;

X=X-xav; Y=Y-yav;                       %mean subtract the X and Y coordinates

hold on; plot(M_10,M_01,'ko'); drawnow
                                        %calculate required central moments
M_11=sum(sum(X.*Y.*I));
M_20=sum(sum(X.^2.*I)); M_02=sum(sum(Y.^2.*I));
M_21=sum(sum(X.^2.*Y.*I)); M_12=sum(sum(X.*Y.^2.*I));
M_30=sum(sum(X.^3.*I)); M_03=sum(sum(Y.^3.*I));
                                        %calculate normalised central moments
eta_11=M_11./M_00.^2;
eta_20=M_20./M_00.^2;
eta_02=M_02./M_00.^2;

eta_21=M_21./M_00.^(5./2);
eta_12=M_12./M_00.^(5./2);
eta_30=M_30./M_00.^(5./2);
eta_03=M_03./M_00.^(5./2);

                                        %calculate Hu moments
Hu_1=eta_20 + eta_02;
Hu_2=(eta_20 - eta_02).^2 + (2.*eta_11).^2;
Hu_3=(eta_30 - 3.*eta_12).^2 + (3.*eta_21 - eta_03).^2;

s=sprintf('Object number is %d',i)
s=sprintf('Hu invariant moments are %f %f %f',Hu_1,Hu_2,Hu_3)

pause;
end

%Comments: This example takes an image containing three similar objects at
%different scale, location and rotation and calculates the first three Hu
%invariant moments. 
