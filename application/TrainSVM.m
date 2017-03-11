function [] = TrainSVM()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% The function trained the support vector machine to classify images, whose
% input are feature vectors generated from dense-SIFT + wordbag or neural network.
% A Support Vector Machine (SVM) is a discriminative classifier formally 
% defined by a separating hyperplane. In other words, given labeled training 
% data.
% In Corel 1000 image dataset, we choose the first 50 images from each
% classes as train data, and 50 images from each classes as test data.
% We use open source library libsvm to train our support vector machine, we
% used two methods to train the SVM, which are all included in the libsvm
% library. One returns the possibility value of each element about the
% possibility they belong to each class. The other returns the raw data of
% decision value of each one-to-one classifier. We have commented one
% methond in the code, but models generated from two methods have been
% stored as .mat file.

clear all;
clc;
close all;

% Determine the type of support machine. Type value 1 represents
% dense-SIFT+wordbag, as well as value 2 represents CNN.
type = 2;
if(type == 1) %dense-SIFT+wordbag
load WordBag.mat

ktrain = zeros(500,500);
training_label_vector = zeros(500,1);

% compute the kernel matrix
for i = 1:500
    for j = 1:500
        ktrain(i,j) = Hellinger(WordBag_Normalized(i,:),WordBag_Normalized(j,:));
    end
end
Ktrain = [(1:500)',ktrain];
clear i j

for i = 1:10
    training_label_vector(((i-1)*50+1):(i*50),:) = ones(50,1)*i;
end

%SVM_Model = libsvmtrain(training_label_vector, Ktrain, '-t 4 -b 1');
SVM_Model_value = libsvmtrain(training_label_vector, Ktrain, '-t 4');

%save('SVM_Model.mat','SVM_Model');
save('SVM_Model_value','SVM_Model_value');
end

if(type == 2) %neural network
    load CNNFeature.mat;
    ktrain = zeros(500,500);
    training_label_vector = zeros(500,1);

% compute the kernel matrix
for i = 1:500
    for j = 1:500
        ktrain(i,j) = Hellinger(Feature_CNN(i,:),Feature_CNN(j,:));
    end
end
Ktrain = [(1:500)',ktrain];
clear i j

for i = 1:10
    training_label_vector(((i-1)*50+1):(i*50),:) = ones(50,1)*i;
end

SVM_Model_CNN = libsvmtrain(training_label_vector, Ktrain, '-t 4 -b 1');
%SVM_Model_value = libsvmtrain(training_label_vector, Ktrain, '-t 4');

save('SVM_Model_CNN.mat','SVM_Model_CNN');
%save('SVM_Model_value','SVM_Model_value');
end
    

end

