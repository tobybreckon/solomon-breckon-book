% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('trui.png');                      			%Read in image
subplot(3,3,1), imshow(A,[]);               		%Display original
h1=fspecial('gaussian',[15 15],6);
h2=fspecial('gaussian',[30 30],12);
subplot(3,3,4), imshow(imfilter(A,h1),[]);   		%Display filtered version sigma=6
subplot(3,3,7), imshow(imfilter(A,h2),[]);   		%Display filtered version sigma=12

[bw,thresh]=edge(A,'log');                  		%Edge detection on original - LOG filter
subplot(3,3,2), imshow(~bw,[]);
[bw,thresh]=edge(A,'canny');                		%Canny edge detection on original 
subplot(3,3,3), imshow(~bw,[]);              		%Display
[bw,thresh]=edge(imfilter(A,h1),'log');      		%LOG Edge detection on sigma=6 
subplot(3,3,5), imshow(~bw,[]);              
[bw,thresh]=edge(imfilter(A,h1),'canny');         	%Canny edge detection on sigma=6
subplot(3,3,6), imshow(~bw,[]);
[bw,thresh]=edge(imfilter(A,h2),'log');      		%LOG Edge detection on sigma=12
subplot(3,3,8), imshow(~bw,[]);              
[bw,thresh]=edge(imfilter(A,h2),'canny');  		%Canny edge detection on sigma=12
subplot(3,3,9), imshow(~bw,[]);
