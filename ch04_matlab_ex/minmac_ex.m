% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
H = imread('trui.png');

I = ordfilt2(H,1,ones(5)); % Apply minimum filter

J = ordfilt2(H,25,ones(5)); % Apply maximum filter

K = imsubtract(J,I); % Subtract I(min) from J(max). 

subplot(1,4,1), imshow(H); subplot(1,4,2), imshow(I); % Display results

subplot(1,4,3), imshow(J,[]); subplot(1,4,4), imshow(K,[]); % Display results
