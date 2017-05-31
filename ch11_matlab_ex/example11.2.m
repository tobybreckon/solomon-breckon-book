% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
clear; NOPTS=200;
mu1 = [1 -1]; cov1 = [.9 .4; .4 .3];              %Define mean and covariance
d1 = mvnrnd(mu1, cov1, NOPTS);                    %Training data for class 1
plot(d1(:,1),d1(:,2),'b.'); hold on;              %Plot class 1 training data
proto1=mean(d1); plot(proto1(1),proto1(2),'ks');  %Calculate & plot prototype 1
 
mu2 = [-1 1]; cov2 = [2 0; 0 2];                  %Define mean and covariance
d2 = mvnrnd(mu2, cov2, NOPTS);                    %Training data for class 1
plot(d2(:,1),d2(:,2),'r.');                       %Plot class 2 training data
proto2=mean(d2); plot(proto2(1),proto2(2),'ks');  %Calculate & plot prototype 2
axis([-6 4 -5 5]); axis square;
 
for i=1:NOPTS
  if norm(d2(i,:)-proto2,2) > norm(d2(i,:)-proto1,2)  %Misclassified points
       plot(d2(i,1),d2(i,2),'go');                    %Plot in green circle
    end
end


