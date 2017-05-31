% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
X = [randn(100,2)+ones(100,2); randn(100,2)-ones(100,2)];                       %Generate random data array
opts = statset('Display','final');                                              %Specify statistics options structure
[cidx, ctrs] = kmeans(X, 2, 'Distance','city','Replicates',5, 'Options',opts);  %Run k means, 5 repeats, city-block metric
plot(X(cidx==1,1),X(cidx==1,2),'r.');                                           %Plot 1st class points ...
hold on; plot(X(cidx==2,1),X(cidx==2,2),'ko');                                  %Plot 2nd class points ...
plot(ctrs(:,1),ctrs(:,2),'rs','MarkerSize',18);                                 %plot class centroids as squares
