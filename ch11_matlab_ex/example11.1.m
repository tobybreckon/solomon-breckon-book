% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
load PCA_data.mat;                                      	%Load PCA coefficients for males and females
f6=female(6,:)./1000; f7=female(7,:)./1000;         %extract female coefficients on 6 and 7 
m6=male(6,:)./1000; m7=male(7,:)./1000;           %extract male coefficients on 6 and 7 
 
F_proto=mean([f6' f7']); 
M_proto=mean([m6' m7']);      			%calculate Male and female prototypes
dely=M_proto(2)-F_proto(2); 
delx=M_proto(1)-F_proto(1); 			%Difference between prototypes
mid_pt=[F_proto(1)+delx./2 F_proto(2)+dely./2];%Midpoint between prototypes
grad=-1./(dely./delx);                                  	%Gradient of linear discriminant
a=1./(mid_pt(2)-grad.*mid_pt(1));                        %Coefficients of linear discriminant
b=grad./(mid_pt(2)-grad.*mid_pt(1));
 
figure;
plot(f6,f7,'r*'); hold on; plot(m6,m7,'kd');            	 %Plot data
x=linspace(-5,5,100); y=(1+b.*x)./a;                     %Plot linear discriminant
plot(x,y,'b-');
 
f_indx=find(a.*f7-b.*f6-1>0)                                  %Find index of misclassified females
m_indx=find(a.*m7-b.*m6-1<0)                            %Find index of misclassified males

