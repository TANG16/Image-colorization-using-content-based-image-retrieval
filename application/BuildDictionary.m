function [] = BuildDictionary()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% This funtion builds dictionary for the source image database using global 
% and local dense sift decriptors.
% Each interest point decriptor is considered as a point in the
% 128-demension space, and we use K-means algorithm to divide these interest
% points into k classes, these classes is considered as "basic words" of
% image dataset. We can use the dictionary composed of these "words" to
% generate wordbag of each image.
% In this project we set k to 200.
% The function produce a FeatureDictionary.mat file which contains three
% matrix DictionaryCenters, DictionaryLabels and DictionaryLength.
% Each row of the matrix DictionaryCenters represents a word in a 
% 128-demension space.
% Each number of the matrix DictionaryLabels represents which word the
% corresponding interest point belongs to.
% Each number of the matrix DictionaryLength represents the word length 
% of each image in source dataset. 
% We use function vl_ikmeans in vlfeat, it is good to process integer data.
% We have tried surf features, but it is not valid in our final version of
% the project.

clear all;
clc;
close all;

AlgorithmType = 1;
run('vlfeat-0.9.18-bin\vlfeat-0.9.18\toolbox\vl_setup');
switch AlgorithmType
case 1
% Generate the matrix to store feature words
load DenseSIFTFeature.mat;


% Generate the initial cluster centers
% InitialCenter_Global = zeros(128,200);
% InitialCenter_Local = zeros(128,200);
% Initial_Global = round(rand(1,200)*475000);
% Initial_Local = round(rand(1,200)*172500);
% Initial_Global = unique(Initial_Global);
% Initial_Local = unique(Initial_Local);
% 
% while(size(Initial_Global,2)~=1000)
% Initial_Global = round(rand(1,1000)*475000);
% Initial_Global = unique(Initial_Global);
% end
% 
% while(size(Initial_Local,2)~=1000)
% Initial_Local = round(rand(1,1000)*172500);
% Initial_Local = unique(Initial_Local);
% end
% 
% for i = 1:200
%     InitialCenter_Global(:,i) = SIFT_Global(:,Initial_Global(1,i)+1);
% end
% 
% for i = 1:200
%     InitialCenter_Local(:,i) = SIFT_Local(:,Initial_Local(1,i)+1);
% end


% Training raw data using K-means method and generate the dictionary
k = 200;
[DictionaryCenters_Global, DictionaryLabels_Global] = vl_ikmeans(SIFT_Global,k);
[DictionaryCenters_Local, DictionaryLabels_Local] = vl_ikmeans(SIFT_Local,k);

% Save the dictionary file
save('FeatureDictionary.mat','DictionaryCenters_Global','DictionaryLabels_Global','DictionaryCenters_Local', 'DictionaryLabels_Local');

%     case 0
% load SurfFeature.mat;
% DictionaryLength = zeros(1,1000);
% for i = 1:1000
%     [row,~] = size(SurfFeature{i});
%     DictionaryLength(1,i) = row;
% end
% NumberOfPoints = sum(DictionaryLength(:));
% DictionaryRawData = zeros(NumberOfPoints,64);
% row = 1;
% for i = 1:1000
%     row1 = row+DictionaryLength(1,i)-1;
%     DictionaryRawData(row:row1,:) = SurfFeature{i};
%     row = row1+1;
% end
% clear SurfFeature;
% training_label_vector = zeros(1000,1);
% for i = 1:1000
% training_label_vector(i,1) = i;
% end
% training_instance_matrix = DictionaryRawData;
% clear  DictionaryRawData;
%         
% 
% clear all;
% clc;
% close all;

end