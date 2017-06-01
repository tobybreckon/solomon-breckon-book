% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%

%% cycle through all PNG files in a given directory
%% (and in this case display them)
%% [for use with suggested student projects on www.fundipbook.com/materials/]

%% change '*.png' in code below for other image types

cd INSERT_DIRECTORY_NAME;

list = dir('*.png');
number_of_files = size(list);

for i= 3: number_of_files(1,1)
    filename = list(i).name;
    I = imread(filename);
    imshow(I);
end
