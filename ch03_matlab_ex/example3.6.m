% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
A=imread('toycars1.png');  % Read in 1st image
B=imread('toycars2.png');  % Read in 2nd image
Abw=im2bw(A);            % convert to binary
Bbw=im2bw(B);            % convert to binary

subplot(1,3,1), imshow(Abw); % Display 1st image 
subplot(1,3,2), imshow(Bbw); % Display 2nd image

Output = xor(Abw, Bbw); % xor images images

subplot(1,3,3), imshow(Output); % Display result

%% Comments 

% - note that the images are first converted to binary using
%   the Matlab im2bw function (with an automatic threshold - Section
%   3.2.3).
% - note that the resulting images from the im2bw function and the xor
%   logical operation is of Matlab type 'logical'.
% - the operators for AND is '&' whilst the operator for OR is '|' and are 
%   applied in infix notation form as A & B, A | B.