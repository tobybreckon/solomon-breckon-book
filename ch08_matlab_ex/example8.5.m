% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('enamel.png'); subplot(1,3,1), imshow(A);                  %Read in image and display
bw=~im2bw(A,0.5); bw = imfill(bw,'holes');                          %Threshold and fill in holes
subplot(1,3,2), imshow(bw);                                 		%Display resulting binary image

[L,num_0]=bwlabel(bw);                                      		%Label and count number of objects
                                                            		%in binary image
se=strel('disk',2);                                        			%Define structuring element, radius=2
count =0;                                                   		%Set number of erosions = 0      
num=num_0;                                                 			%initialise number of objects in image

while num>0                                                 		%Begin iterative erosion 
count=count+1
    bw=imerode(bw,se);                                              %Erode
    [L,num]=bwlabel(bw);                                    		%Count and label objects
    P(count)=num_0-num;                                           	%Build discrete distribution
    figure(2); imshow(bw); drawnow;                                 %Display eroded binary image
end

    figure(2); subplot(1,2,1), plot(0:count,[0 P],'ro');            %Plot Cumulative distribution
    axis square;axis([0 count 0 max(P)]);                           %Force square axis
    xlabel('Size'); ylabel('Particles removed')                     %Label axes 
    subplot(1,2,2), plot(diff([0 P]),'k*'); axis square;            %Plot estimated size density function
