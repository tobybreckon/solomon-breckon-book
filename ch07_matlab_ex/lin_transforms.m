% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
%lin_transforms.m
%BASIC LINEAR TRANSFORMATION IN 2-D HOMOGENEOUS COORDINATES
%TRANSLATION, SHEARING, SCALING AND ROTATION
%Define original shape and plot
S=[1 -1 -1 1; 1 1 -1 -1; 1 1 1 1]
x=S(1,:); y=S(2,:);
patch(x,y,'r')
grid on
axis([-2 2 -2 2])
%Define transforming matrices
%Translation
T_tr=[1 0 0.5; 0 1 0.5; 0 0 1];
M=T_tr*S; 
figure; patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); axis off
%Scaling
T_sc=0.5.*eye(3); 
M=T_sc*S; 
figure; patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); axis off
%X Shearing
T_sh=[1 0.5 0; 0 1 0; 0 0 1]
M=T_sh*S; 
figure; patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); axis off
%y Shearing
T_sh=[1 0 0; 0.5 1 0; 0 0 1]
M=T_sh*S; 
figure; patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); axis off
%Rotation by theta
theta=pi./4; 
T_R=[cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1]
M=T_R*S; 
figure; patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); axis off
