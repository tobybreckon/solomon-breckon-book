% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('overlapping_euros.jpg');                          %Read image
Agrad=ordfilt2(A,25,ones(5))-ordfilt2(A,1,ones(5));         %Calculate basic segmentation function 
figure, subplot(1,3,1), imshow(A,[]);                       %Display image 
subplot(1,3,2), imshow(Agrad,[]);                           %Display basic segmentation function                                         
L = watershed(Agrad), rgb = label2rgb(L,'hot',[.5 .5 .5]);  %calculate watershed 
subplot(1,3,3), imshow(rgb,'InitialMagnification','fit')    %Display labelled image
