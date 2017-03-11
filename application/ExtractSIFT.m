function [] = ExtractSIFT()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% This funtion extracts local and gloabl dense-SIFT features of images in 
% database Corel 1000. 
% Dense Scale Invariant Feature Transform Features is a type of local 
% feature detector and descriptor.
% In the project we combine global and local SIFT features together to form
% final feature vector.
% Corel 1000 image database is a database for testing algorithms for image
% retrieval, which contains 1000 natural images classified into 10 classes.
% Reference: Jia Li, James Z. Wang, ``Automatic linguistic indexing of 
% pictures by a statistical modeling approach,'' 
% IEEE Transactions on Pattern Analysis and Machine Intelligence, 
% vol. 25, no. 9, pp. 1075-1088, 2003.
% Several interest points are detected from the original image, and each
% interest point is presented using a 128-dimension vector.
% The function produce a DenseSIFTFeature.mat file which contains a cell. 
% The cell stores information of interest points of each source images in 
% dataset.

clear all;
clc;
close all;

run('vlfeat-0.9.18-bin\vlfeat-0.9.18\toolbox\vl_setup');
% Generate the cell to store features
SIFT_Global = [];
SIFT_Local = [];

% The factor of subimage we are going to extract local dense-SIFT features.
% These factors reach optimal results according to literature.
x = 0.22;
y = 0.6;

% Extract SIFT features
% Vlfeat open source library for Matlab is used

str = 'Corel_Source/';
for i = 1:500
I = imread([str,num2str(i),'.jpg']);
I = rgb2gray(I);
I_Global = single(I);


[row,column] = size(I);
p1 = round(row*x);
p2 = round(row*(x+y));
p3 = round(column*x);
p4 = round(column*(x+y));
I_Local = I(p1:p2,p3:p4);
I_Local = single(I_Local);

% Extract global SIFT features.
% We use stride value of 10. Larger stride value will decrease the
% performance of retrieval result, while smaller stride value will largely
% increase the cost of computation. It is a trade-off depending on the
% machine type and the precision you hope.
stride = 10;
[~, descr_Global] = vl_dsift(I_Global, 'step', stride);
SIFT_Global = [SIFT_Global descr_Global];

% Extract local SIFT features.
[~, descr_Local] = vl_dsift(I_Local, 'step', stride);
SIFT_Local = [SIFT_Local descr_Local];
fprintf('Extracting the %dth image\n ',i);
end

% Save the feature file
save('DenseSIFTFeature.mat','SIFT_Global','SIFT_Local');

clear all;
clc;
close all;

end