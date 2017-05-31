% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
%MATLAB EXAMPLE 9.5			
W=[65 75 53 54 61 88 70 78 52 95 70 72]'                        %1. Form data vector on weight
H=[170 176 154 167 171 184 182 190 166 168 176 175]'            %Form data vector on height
XM=[mean(W).*ones(length(W),1) mean(H).*ones(length(H),1)]      %matrix with mean values replicated
X=[W H]-XM;                                            			%Form mean-subtracted data matrix
Cx=cov(X)                                              			%calculate covariance on data
[R,LAMBDA,Q]=svd(Cx)                                    		%Get eigenvalues LAMBDA and 
                                                        		%eigenvectors R
V=X*R;                                                  		%Calculate principal components	

subplot(1,2,1), plot(X(:,1),X(:,2),'ko'); grid on;      		%2. display data on original axes 
subplot(1,2,2), plot(V(:,1),V(:,2),'ro'); grid on;      		%display PCs as data in rotated space

XR=XM+V*R'                                             		 	%3. Reconstruct data in terms of PCs
XR-[W H]                                                		%Confirm reconstruction (diff = 0)
V'*V./(length(W)-1)                                     		%4. Confirm covariance terms 
%MATLAB FUNCTIONS
cov, mean, svd,

%COMMENTS
%This example 1. calculates the principal components of the data. 2. displays the data in the new (%principal ) axes 3. confirms that the original data can be “reconstructed” in terms of the principal
%components and finally 4. confirms that the variance of the principal components is equal to the %eigenvalues contained in matrix LAMBDA.
%Note that we have used the Matlab function svd (singular value decomposition) to calculate the %eigenvectors and eigenvalues rather than eig. The reason for this is that svd orders the eigenvalues
%(and their associated eigenvectors) strictly according to size from largest to smallest (eig does not). %This is a desirable and natural ordering when calculating principal components which are intended to %successively describe the maximum possible amount of variance in the data.
