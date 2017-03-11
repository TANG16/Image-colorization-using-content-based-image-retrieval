function [predicted_label, accuracy, decision_values] = TestSVM_single()

% It is just the test code to evaluate the performance of pre-trained support
% vector machine in the level of single image.
% You can ignore the code, it is just the test during the implentation of
% the project.

 clear all;
 clc;
 close all;

str = 'Corel_Test/';
%str = 'Corel_Source/';

I = imread([str,num2str(214),'.jpg']);
I = rgb2gray(I);
I_Global_Test = single(I);
x = 0.22;
y = 0.6;
[row,column] = size(I);
p1 = round(row*x);
p2 = round(row*(x+y));
p3 = round(column*x);
p4 = round(column*(x+y));
I_Local_Test = I(p1:p2,p3:p4);
I_Local_Test = single(I_Local_Test);

stride = 10;
[~, SIFT_Global_Test] = vl_dsift(I_Global_Test, 'step', stride);

[~, SIFT_Local_Test] = vl_dsift(I_Local_Test, 'step', stride);

label_Global = zeros(1,950);
label_Local = zeros(1,345);
cluster_Global = zeros(1,200);
cluster_Local = zeros(1,200);

load FeatureDictionary.mat;
for i = 1:950
for j = 1:200
cluster_Global(1,j) = pdist2(double(SIFT_Global_Test(:,i)'),double(DictionaryCenters_Global(:,j)'));
end
[~,Ni_Global] = find(cluster_Global == min(cluster_Global(:)));
label_Global(1,i) = Ni_Global;
end

for i = 1:345
for j = 1:200
cluster_Local(1,j) = pdist2(double(SIFT_Local_Test(:,i)'),double(DictionaryCenters_Local(:,j)'));
end
[~,Ni_Local] = find(cluster_Local == min(cluster_Local(:)));
label_Local(1,i) = Ni_Local;
end

clear i;

FeatureVector_Global = zeros(200,1);
FeatureVector_Local = zeros(200,1);

for i = 1:200
[~,Ni_Global] = size(find(label_Global==i));
[~,Ni_Local] = size(find(label_Local==i));
FeatureVector_Global(i,1) = Ni_Global;
FeatureVector_Local(i,1) = Ni_Local;
end

clear i

FeatureVector_Normalized = [FeatureVector_Global;FeatureVector_Local];
FeatureVector_Normalized = FeatureVector_Normalized./(1295*ones(400,1));
FeatureVector_Normalized = FeatureVector_Normalized';

load WordBag.mat
ktest = zeros(1,500);
for i = 1:500
    ktest(1,i) = Hellinger(FeatureVector_Normalized,WordBag_Normalized(i,:));
end

Ktest = [(1:1)', ktest];
testing_label_vector = ones(1,1);

load SVM_Model.mat
[predicted_label, accuracy, decision_values] = libsvmpredict(testing_label_vector, Ktest, SVM_Model,'-b 1');





end

