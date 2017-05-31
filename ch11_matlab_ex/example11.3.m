% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
clear; NOPTS=200;                                       %generate TRAINING DATA....
mu1 = [1 -1]; cov1 = [.9 .4; .4 .3];                    %Define mean and covariance
d1 = mvnrnd(mu1, cov1, NOPTS);                          %Training data for class 1
subplot(2,2,1), plot(d1(:,1),d1(:,2),'b.'); hold on;    %Plot class 1 training data
proto1=mean(d1); plot(proto1(1),proto1(2),'ks');        %Calculate and plot prototype 1

mu2 = [-1 1]; cov2 = [2 0; 0 2];                        %Define mean and covariance
d2 = mvnrnd(mu2, cov2, NOPTS);                          %Training data for class 2
plot(d2(:,1),d2(:,2),'r.');                             %Plot class 2 training data
proto2=mean(d2); plot(proto2(1),proto2(2),'ks');        %Calculate and plot prototype 2
axis([-6 4 -5 5]); axis square;
title('TRAINING DATA')
group=[ones(NOPTS,1); 2.*ones(NOPTS,1)];                %vector to specify actual classes of training points

%for i=1:NOPTS
%    if norm(d2(i,:)-proto2,2) > norm(d2(i,:)-proto1,2)  %Find misclassified points
%       plot(d2(i,1),d2(i,2),'go');                      %Plot on top in green circles
%    end
%end

%%%%%%%%%%%%%%%%%
%CLASS = CLASSIFY(SAMPLE,TRAINING,GROUP,TYPE)
                                            %generate TEST DATA

N1=50; N2=100;                                          %Number of test points from classes
testgroup=[ones(N1,1); 2.*ones(N2,1)];                  %vector to specify actual class of test points
sample=[mvnrnd(mu1, cov1, N1); mvnrnd(mu2, cov2, N2)];  %generate test data points         

subplot(2,2,2),
plot(proto1(1),proto1(2),'ks'); 
axis([-6 4 -5 5]); axis square; hold on;
plot(proto2(1),proto2(2),'ks');
plot(sample(1:N1,1),sample(1:N1,2),'b*');
plot(sample(N1+1:N1+N2,1),sample(N1+1:N1+N2,2),'r*');
title('TEST DATA');

[class,err]=classify(sample,[d1;d2],group,'DiagLinear',[0.9 0.1]);%Classify using diagonal covariance estimate
subplot(2,2,3),
plot(proto1(1),proto1(2),'ks'); 
axis([-6 4 -5 5]); axis square; hold on;
plot(proto2(1),proto2(2),'ks');
plot(sample(1:N1,1),sample(1:N1,2),'b*');
plot(sample(N1+1:N1+N2,1),sample(N1+1:N1+N2,2),'r*');

for i=1:size(class,1)
    if class(i)~=testgroup(i)
        plot(sample(i,1),sample(i,2),'go');
    end
end

[class,err]=classify(sample,[d1;d2],group,'DiagLinear',[N1./(N1+N2) N2./(N1+N2)]);%Classify using diagonal covariance estimate
subplot(2,2,4),
plot(proto1(1),proto1(2),'ks'); 
axis([-6 4 -5 5]); axis square; hold on;
plot(proto2(1),proto2(2),'ks');
plot(sample(1:N1,1),sample(1:N1,2),'b*');
plot(sample(N1+1:N1+N2,1),sample(N1+1:N1+N2,2),'r*');

for i=1:size(class,1)
    if class(i)~=testgroup(i)
        plot(sample(i,1),sample(i,2),'go');
    end
end