% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
I=imread('cameraman.tif'); % Read in image

subplot(2,2,1), imshow(I); % Display image

Id=im2double(I);
Output1=4*(((1+0.3).^(Id)) - 1);
Output2=4*(((1+0.4).^(Id)) - 1);
Output3=4*(((1+0.6).^(Id)) - 1);

subplot(2,2,2), imshow(Output1); % Display result images
subplot(2,2,3), imshow(Output2);
subplot(2,2,4), imshow(Output3);
