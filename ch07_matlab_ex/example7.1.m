% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
load procrustes_star.mat;                                   %load coordinates of two shapes
whos                                                        %input_points and base_points
subplot(1,2,1),
plot(base_points(:,1),base_points(:,2),'kd'); hold on;      %Plot the shape coordinates
plot(input_points(:,1),input_points(:,2),'ro'); axis square; grid on
[D,Z,transform]=procrustes(input_points,base_points);       %Procrustes align input to base
subplot(1,2,2),
plot(input_points(:,1),input_points(:,2),'kd'); hold on;
plot(Z(:,1),Z(:,2),'ro'); axis square; grid on; hold off;	%Plot aligned coordinates


