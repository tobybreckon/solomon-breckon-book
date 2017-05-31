% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
function [a,b,dc]=fseries_1D(f,L,N)
%function [a,b,dc]=fseries_1D(f,L,N)
%finds the dcterm and first N coefficients for a real Fourier series representation
%of a discrete 1-D input sample signal f with M=length(f)sample points.

%The signal can be estimated using M-1 harmonics by:
%                    M
% f(i) = dc + sum (a(n)*cos(2*pi*n*m/M) + b(n)*sin(2*pi*n*m/M)
%                   n=1


M=length(f);        %Number of sampled points in input vector

% Define the vectors for computing The Fourier coefficients
a = zeros(N,1);
b = zeros(N,1);
% Compute the dc-level (the a(0) component).
%dc = 2*sum(f)/M;  % Note: avoids indexing problems
dc = 1*sum(f)/M;  % Note: avoids indexing problems

% Compute M-1 more coefficients
for n = 1:N
   sumcos=0.0;
   sumsin=0.0;
   for m=1:M,
      sumcos = sumcos + f(m)*cos(2*pi*n*m/M);
      sumsin = sumsin + f(m)*sin(2*pi*n*m/M);
   end
   a(n) = 2*sumcos/M;
   b(n) = 2*sumsin/M;
end
%