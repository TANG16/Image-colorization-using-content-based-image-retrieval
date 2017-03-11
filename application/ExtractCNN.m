function [] = ExtractCNN()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% The function extracts the features of source images after being processed
% by pre-trained convolution neural network model.
% The feature of each image are saved in the .mat file, which are used for
% further evaluation of image retrieval.

clear all;
clc;
close all;

run ./matconvnet-1.0-beta17/matlab/vl_setupnn
Feature_CNN = [];
str = 'Corel_Source/';
pretrained_net = load('imagenet-vgg-f.mat') ; %load the pre-trained model.

% Extract the convolution neural network feature of source image using
% imagenet model.
% Input to the pre-trained network is the difference between averageimage
% of imagenet and normalized source image.
% We use the output of the 20th layer as feature vector of input image.
% Each feature vector is 4096-dimension.

for i = 1:500
    I = imread([str,num2str(i),'.jpg']);
    I = single(I);
    I = imresize(I,[224 224]);
    I = I - pretrained_net.meta.normalization.averageImage;
    res = vl_simplenn(pretrained_net,I) ;
    featureCNN = res(20).x;
    Feature_CNN = [Feature_CNN;featureCNN(:)'];
    fprintf('Extracting the %dth image\n ',i);
end

% Principal components analysis of feature vector.
% Reduct demension of original output vector from 4096 to 128, which makes
% latter computation more quick.
% According to literature, this reduction will not influence performance
% of the network significantly.

 [coeff_CNN, ~,~] = princomp(Feature_CNN);
 Feature_CNN = Feature_CNN*coeff_CNN(:, 1:128);
 
 % Generalize the output feature vector using L2 norm.
 % It makes feature vectors  easier to be processed by support vector
 % machine.
 for i = 1:500
     if(sqrt(Feature_CNN(i,:)*Feature_CNN(i,:)')~=0)
         Feature_CNN(i,:) = Feature_CNN(i,:)./(sqrt((Feature_CNN(i,:)*Feature_CNN(i,:)')));
     end
 end
 
 save('CNNFeature.mat','Feature_CNN','coeff_CNN');

end

