% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
function fapprox=fbuild_1D(a,b,dc,M,L)
%function fapprox=fbuild_1D(a,b,dc,M,L)
%Build a function from the first N harmonic terms of its
%Fourier series where N=length(a)=length(b) and M is the number
%of sample points of the function over 1 period and L is the
%period of the function

N=length(a); dx=L/M;
x=linspace(dx,L,M); cosmat=zeros(M,N); sinmat=zeros(M,N);
%Build Fourier matrices
for n=1:N
    cosmat(:,n)=cos(2*pi*n*x/L);
    sinmat(:,n)=sin(2*pi*n*x/L);
end
fapprox=dc+cosmat*a+sinmat*b;