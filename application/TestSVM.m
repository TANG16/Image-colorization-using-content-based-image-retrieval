function [] = TestSVM()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% It is the test code to test test images, to make sure the
% performance of pre-trained support vector machine is good enough to
% complete the function of image retrieval.
% As code of trainsvm, it has two types of methods to choose, dense-SIFT +
% wordbag and convolution neural network.

clear all;
clc;
close all;

type = 2;
if(type == 1)
SIFT_Global_Test = [];
SIFT_Local_Test = [];

x = 0.22;
y = 0.6;

str = 'Corel_Test/';
for i = 1:500
I = imread([str,num2str(i),'.jpg']);
I = rgb2gray(I);
I_Global_Test = single(I);
[row,column] = size(I);
p1 = round(row*x);
p2 = round(row*(x+y));
p3 = round(column*x);
p4 = round(column*(x+y));
I_Local_Test = I(p1:p2,p3:p4);
I_Local_Test = single(I_Local_Test);

stride = 10;
[~, descr_Global] = vl_dsift(I_Global_Test, 'step', stride);
SIFT_Global_Test = [SIFT_Global_Test descr_Global];

[~, descr_Local] = vl_dsift(I_Local_Test, 'step', stride);
SIFT_Local_Test = [SIFT_Local_Test descr_Local];

fprintf('Extracting the %dth image\n ',i);
end

% label_Global = zeros(1,475000);
% label_Local = zeros(1,172500);
% cluster_Global = zeros(1,200);
% cluster_Local = zeros(1,200);

load FeatureDictionary.mat;

% for i = 1:475000
%     for j = 1:200
%         cluster_Global(1,j) = pdist2(single(SIFT_Global_Test(:,i)',double(DictionaryCenters_Global(:,k)'));
%         end
%         [~,Ni_Global] = find(cluster_Global == min(cluster_Global(:)));
%         label_Global(i,j) = Ni_Global(:,1);
%     end
% end
% clear i j k
% for i = 1:500
%     for j = 1:950
%         for k = 1:200
%             cluster_Local(1,j) = pdist2(double(SIFT_Local_Test(:,(i-1)*500+j)'),double(DictionaryCenters_Local(:,k)'));
%         end
%         [~,Ni_Local] = find(cluster_Local == min(cluster_Local(:)));
%         label_Local(i,j) = Ni_Local(:,1);
%     end
% end
% clear i j k
label_Global = vl_ikmeanspush(SIFT_Global_Test,DictionaryCenters_Global);
label_Local = vl_ikmeanspush(SIFT_Local_Test,DictionaryCenters_Local);


FeatureVector_Global_Test = zeros(200,500);
FeatureVector_Local_Test = zeros(200,500);

for i = 1:500
    for j = 1:200
        [~,Ni_Global] = size(find(label_Global(:,((i-1)*950+1):(i*950))==j));
        [~,Ni_Local] = size(find(label_Local(:,((i-1)*345+1):(i*345))==j));
        FeatureVector_Global_Test(j,i) = Ni_Global;
        FeatureVector_Local_Test(j,i) = Ni_Local;
    end
end

FeatureVector_Normalized = [FeatureVector_Global_Test;FeatureVector_Local_Test];
FeatureVector_Normalized = FeatureVector_Normalized./(1295*ones(400,500));
FeatureVector_Normalized = FeatureVector_Normalized';

load WordBag.mat

ktest = zeros(500,500);
for i = 1:500
    for j = 1:500
    ktest(i,j) = Hellinger(FeatureVector_Normalized(i,:),WordBag_Normalized(j,:));
    end
end

Ktest = [(1:500)', ktest];
clear i

testing_label_vector = zeros(500,1);
for i = 1:10
    testing_label_vector(((i-1)*50+1):(i*50),:) = ones(50,1)*i;
end

load SVM_Model.mat
[predicted_label, accuracy, decision_values] = libsvmpredict(testing_label_vector, Ktest, SVM_Model,'-t 4 -b 1');

end

if type == 2
 run ./matconvnet-1.0-beta17/matlab/vl_setupnn
str = 'Corel_Test/';

FeatureVector = zeros(500,128);
pretrained_net = load('imagenet-vgg-f.mat');
load('CNNFeature.mat');
for i = 1:500
    I = imread([str,num2str(i),'.jpg']);
    I = single(repmat(I,[1 1 3]));
    I = imresize(I,[224 224]);
    I = I - pretrained_net.meta.normalization.averageImage;
    res = vl_simplenn(pretrained_net,I) ;
    CNNFeature_test = res(20).x;
    CNNFeature_test = CNNFeature_test(:)';
    CNNFeature_test = CNNFeature_test*coeff_CNN(:, 1:128);
     if(sqrt(CNNFeature_test*CNNFeature_test')~=0)
     CNNFeature_test = CNNFeature_test./(sqrt(CNNFeature_test*CNNFeature_test'));
     end
     FeatureVector(i,:) = CNNFeature_test;
     fprintf('CNN Extracting the %dth image\n ',i);
end


ktest = zeros(500,500);
for i = 1:500
    for j = 1:500
    ktest(i,j) = Hellinger(FeatureVector(i,:),FeatureVector(j,:));
    end
end

Ktest = [(1:500)', ktest];
clear i

testing_label_vector = zeros(500,1);
for i = 1:10
    testing_label_vector(((i-1)*50+1):(i*50),:) = ones(50,1)*i;
end

load SVM_Model_CNN.mat
[predicted_label, accuracy, decision_values] = libsvmpredict(testing_label_vector, Ktest, SVM_Model_CNN,'-b 1');

end


end

