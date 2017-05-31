% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('Noisy_Two_Ls.png');                       %Read in image
                                					%CASE 1
se1=[0 0 0; 1 1 0; 0 1 0];          				%SE1 defines the hits
se2=[1 1 1; 0 0 1; 0 0 1];                          %SE2 defines the misses
bw=bwhitmiss(A,se1,se2);                            %Apply hit-or-miss transform
subplot(2,2,1), imshow(A,[0 1]);    				%Display Image
subplot(2,2,2), imshow(bw,[0 1]);                   %Display located pixels

                                    				
interval=[-1 -1 -1; 1 1 -1; 0 1 -1];				%NOTE ALTERNATIVE SYNTAX 
                                                    %1s for hits, -1 for misses; 0s for don't care
bw=bwhitmiss(A,interval);           				%Apply hit-or-miss transform
subplot(2,2,3), imshow(bw,[0 1]);                   %Display located pixels

                                    				%CASE 2
interval=[0 -1 -1; 0 1 -1; 0 0 0];  				%1s for hits, -1 for misses; 0s for don't care
bw=bwhitmiss(A,interval);                           %Apply hit-or-miss transform
subplot(2,2,4), imshow(bw,[0 1]);                   %Display located pixels

