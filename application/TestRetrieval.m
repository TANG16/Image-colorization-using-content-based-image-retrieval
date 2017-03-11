% function [RetrievalResultTop20] = TestRetrieval(ImageId,type)
function [RetrievalResultTop20,resultsort] = TestRetrieval(I,type)
% function [] = TestRetrieval()
%     clear all;
%     clc;
%     close all;

% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% It is the code that retrieval the images that are similiar with the
% target input image.
% The function have different input type and output type because it
% performs different functions during the implementation of our project.
% The function [RetrievalResultTop20] = TestRetrieval(ImageId,type)
% performs as the helper function of Top 20 precision calculation. The
% function function [] = TestRetrieval() performs as the test function of
% basic visualization when test different algorithms. But now it is just
% the function to be called by GUI, to retrieval the images. So don't worry
% about the commented code in the function. It may perform as test code
% during development.

if type == 1 % If retrieval images using dense-SIFT+wordbag
run('vlfeat-0.9.18-bin\vlfeat-0.9.18\toolbox\vl_setup');
load DecisionValue_Source.mat;
% str = 'Corel_Test/';
% str_Source = 'Corel_Source/';
% ImageId =222;
% 
% I = imread([str,num2str(ImageId),'.jpg']);
%I = rgb2gray(I);

% Compute the local and global dense-SIFT features of the single input
% image.
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

load FeatureDictionary.mat;

label_Global = vl_ikmeanspush(SIFT_Global_Test,DictionaryCenters_Global);
label_Local = vl_ikmeanspush(SIFT_Local_Test,DictionaryCenters_Local);

FeatureVector_Global_Test = zeros(200,1);
FeatureVector_Local_Test = zeros(200,1);

% Generate the wordbag feature vector of the single image.

for i = 1:200
        [~,Ni_Global] = size(find(label_Global==i));
        [~,Ni_Local] = size(find(label_Local==i));
        FeatureVector_Global_Test(i,1) = Ni_Global;
        FeatureVector_Local_Test(i,1) = Ni_Local;
end

FeatureVector_Normalized = [FeatureVector_Global_Test;FeatureVector_Local_Test];
FeatureVector_Normalized = FeatureVector_Normalized./(1295*ones(400,1));
FeatureVector_Normalized = FeatureVector_Normalized';

% Classify the image using pre-trained support-vector machine and get the decision
% value, as well as possibility. They are going to be used as feature
% vectors. Evaluating the similarity between two images can determine the
% simliarity between them.

load WordBag.mat
ktest = zeros(1,500);
for i = 1:500
    ktest(1,i) = Hellinger(FeatureVector_Normalized,WordBag_Normalized(i,:));
end
% Applying the hellinger kernel.

Ktest = [(1:1)', ktest];
testing_label_vector = ones(1,1);

load SVM_Model.mat
load SVM_Model_value.mat
DecisionValue_Probability_Test = [];
[predicted_label, accuracy, decision_values_test] = libsvmpredict(testing_label_vector, Ktest, SVM_Model,'-b 1');
DecisionValue_Probability_Test = decision_values_test;
[predicted_label, accuracy, decision_values_test] = libsvmpredict(testing_label_vector, Ktest, SVM_Model_value);
scores = zeros(500,1);
classify_score_test = zeros(1,10);
FinalScores_test = zeros(1,10);


% Compute the decision value for each classes, add the decision value of 9
% one-to-one classifiers together. Larger value means the image has larger
% possibility to belong to the class.

classify_score_test(1,1) = decision_values_test(1,1)+decision_values_test(1,2)+decision_values_test(1,3)+decision_values_test(1,4)+decision_values_test(1,5)+decision_values_test(1,6)+decision_values_test(1,7)...
        +decision_values_test(1,8)+decision_values_test(1,9);
classify_score_test(1,2) = -decision_values_test(1,1)+decision_values_test(1,10)+decision_values_test(1,11)+decision_values_test(1,12)+decision_values_test(1,13)+decision_values_test(1,14)+decision_values_test(1,15)...
        +decision_values_test(1,16)+decision_values_test(1,17);
classify_score_test(1,3) = -decision_values_test(1,2)-decision_values_test(1,10)+decision_values_test(1,18)+decision_values_test(1,19)+decision_values_test(1,20)+decision_values_test(1,21)+decision_values_test(1,22)...
        +decision_values_test(1,23)+decision_values_test(1,24);
classify_score_test(1,4) = -decision_values_test(1,3)-decision_values_test(1,11)-decision_values_test(1,18)+decision_values_test(1,25)+decision_values_test(1,26)+decision_values_test(1,27)+decision_values_test(1,28)...
        +decision_values_test(1,29)+decision_values_test(1,30);
classify_score_test(1,5) = -decision_values_test(1,4)-decision_values_test(1,12)-decision_values_test(1,19)-decision_values_test(1,25)+decision_values_test(1,31)+decision_values_test(1,32)+decision_values_test(1,33)...
        +decision_values_test(1,34)+decision_values_test(1,35);
classify_score_test(1,6) = -decision_values_test(1,5)-decision_values_test(1,13)-decision_values_test(1,20)-decision_values_test(1,26)-decision_values_test(1,31)+decision_values_test(1,36)+decision_values_test(1,37)...
        +decision_values_test(1,38)+decision_values_test(1,39);
classify_score_test(1,7) = -decision_values_test(1,6)-decision_values_test(1,14)-decision_values_test(1,21)-decision_values_test(1,27)-decision_values_test(1,31)-decision_values_test(1,36)+decision_values_test(1,40)...
        +decision_values_test(1,41)+decision_values_test(1,42);
classify_score_test(1,8) = -decision_values_test(1,7)-decision_values_test(1,15)-decision_values_test(1,22)-decision_values_test(1,28)-decision_values_test(1,32)-decision_values_test(1,37)-decision_values_test(1,40)...
        +decision_values_test(1,43)+decision_values_test(1,44);
classify_score_test(1,9) = -decision_values_test(1,8)-decision_values_test(1,16)-decision_values_test(1,23)-decision_values_test(1,29)-decision_values_test(1,33)-decision_values_test(1,38)-decision_values_test(1,41)...
        -decision_values_test(1,43)+decision_values_test(1,45);
classify_score_test(1,10) = -decision_values_test(1,9)-decision_values_test(1,17)-decision_values_test(1,24)-decision_values_test(1,30)-decision_values_test(1,34)-decision_values_test(1,39)-decision_values_test(1,42)...
        -decision_values_test(1,44)-decision_values_test(1,45);
    
[y,ps] = mapminmax(classify_score_test(1,:));   
ps.ymin = 0;      
[classify_score_test_Normalized,ps] = mapminmax(classify_score_test(1,:),ps); 

% Compute the label value, which determines how many classifiers classify
% the image into an exact class. Larger value means the image has larger
% possibility to belong to the class.(Maximum is 9)

classify_label_test = zeros(1,10);
classify_supportscore_test = zeros(1,10);
if decision_values_test(1,1)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,1);
else
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)-decision_values_test(1,1);
end
if decision_values_test(1,2)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,2);
else
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)-decision_values_test(1,2);
end
if decision_values_test(1,3)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,3);
else
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)-decision_values_test(1,3);
end
if decision_values_test(1,4)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,4);
else
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)-decision_values_test(1,4);
end
if decision_values_test(1,5)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,5);
else
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)-decision_values_test(1,5);
end
if decision_values_test(1,6)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,6);
else
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)-decision_values_test(1,6);
end
if decision_values_test(1,7)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,7);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,7);
end
if decision_values_test(1,8)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,8);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,8);
end
if decision_values_test(1,9)>0
classify_label_test(1,1) = classify_label_test(1,1)+1;
classify_supportscore_test(1,1) = classify_supportscore_test(1,1)+decision_values_test(1,9);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,9);
end
if decision_values_test(1,10)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,10);
else
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)-decision_values_test(1,10);
end
if decision_values_test(1,11)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,11);
else
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)-decision_values_test(1,11);
end
if decision_values_test(1,12)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,12);
else
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)-decision_values_test(1,12);
end
if decision_values_test(1,13)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,13);
else
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)-decision_values_test(1,13);
end
if decision_values_test(1,14)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,14);
else
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)-decision_values_test(1,14);
end
if decision_values_test(1,15)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,15);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,15);
end
if decision_values_test(1,16)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,16);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,16);
end
if decision_values_test(1,17)>0
classify_label_test(1,2) = classify_label_test(1,2)+1;
classify_supportscore_test(1,2) = classify_supportscore_test(1,2)+decision_values_test(1,17);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,17);
end
if decision_values_test(1,18)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,18);
else
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)-decision_values_test(1,18);
end
if decision_values_test(1,19)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,19);
else
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)-decision_values_test(1,19);
end
if decision_values_test(1,20)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,20);
else
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)-decision_values_test(1,20);
end
if decision_values_test(1,21)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,21);
else
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)-decision_values_test(1,21);
end
if decision_values_test(1,22)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,22);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,22);
end
if decision_values_test(1,23)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,23);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,23);
end
if decision_values_test(1,24)>0
classify_label_test(1,3) = classify_label_test(1,3)+1;
classify_supportscore_test(1,3) = classify_supportscore_test(1,3)+decision_values_test(1,24);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,24);
end
if decision_values_test(1,25)>0
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)+decision_values_test(1,25);
else
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)-decision_values_test(1,25);
end
if decision_values_test(1,26)>0
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)+decision_values_test(1,26);
else
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)-decision_values_test(1,25);
end
if decision_values_test(1,27)>0
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)+decision_values_test(1,27);
else
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)-decision_values_test(1,27);
end
if decision_values_test(1,28)>0
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)+decision_values_test(1,28);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,28);
end
if decision_values_test(1,29)>0
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)+decision_values_test(1,29);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,29);
end
if decision_values_test(1,30)>0
classify_label_test(1,4) = classify_label_test(1,4)+1;
classify_supportscore_test(1,4) = classify_supportscore_test(1,4)+decision_values_test(1,30);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,30);
end
if decision_values_test(1,31)>0
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)+decision_values_test(1,31);
else
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)-decision_values_test(1,31);
end
if decision_values_test(1,32)>0
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)+decision_values_test(1,32);
else
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)-decision_values_test(1,32);
end
if decision_values_test(1,33)>0
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)+decision_values_test(1,33);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,33);
end
if decision_values_test(1,34)>0
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)+decision_values_test(1,34);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,34);
end
if decision_values_test(1,35)>0
classify_label_test(1,5) = classify_label_test(1,5)+1;
classify_supportscore_test(1,5) = classify_supportscore_test(1,5)+decision_values_test(1,35);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,35);
end
if decision_values_test(1,36)>0
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)+decision_values_test(1,36);
else
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)-decision_values_test(1,36);
end
if decision_values_test(1,37)>0
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)+decision_values_test(1,37);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,37);
end
if decision_values_test(1,38)>0
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)+decision_values_test(1,38);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,38);
end
if decision_values_test(1,39)>0
classify_label_test(1,6) = classify_label_test(1,6)+1;
classify_supportscore_test(1,6) = classify_supportscore_test(1,6)+decision_values_test(1,39);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,39);
end
if decision_values_test(1,40)>0
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)+decision_values_test(1,40);
else
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)-decision_values_test(1,40);
end
if decision_values_test(1,41)>0
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)+decision_values_test(1,41);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,41);
end
if decision_values_test(1,42)>0
classify_label_test(1,7) = classify_label_test(1,7)+1;
classify_supportscore_test(1,7) = classify_supportscore_test(1,7)+decision_values_test(1,42);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,42);
end
if decision_values_test(1,43)>0
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)+decision_values_test(1,43);
else
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)-decision_values_test(1,43);
end
if decision_values_test(1,44)>0
classify_label_test(1,8) = classify_label_test(1,8)+1;
classify_supportscore_test(1,8) = classify_supportscore_test(1,8)+decision_values_test(1,44);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,44);
end
if decision_values_test(1,45)>0
classify_label_test(1,9) = classify_label_test(1,9)+1;
classify_supportscore_test(1,9) = classify_supportscore_test(1,9)+decision_values_test(1,45);
else
classify_label_test(1,10) = classify_label_test(1,10)+1;
classify_supportscore_test(1,10) = classify_supportscore_test(1,10)-decision_values_test(1,45);
end

    for i = 1:10
        if classify_label_test(1,i)~=0
            FinalScores_test(1,i) = classify_supportscore_test(1,i)/(2*classify_label_test(1,i)) + classify_label_test(1,i)/18;
        else
        FinalScores_test(1,i) = 0;
        end
    end

classify_label_test_Normalized = classify_label_test./(9*ones(1,10));
ClassifyLabels_Normalized = ClassifyLabels./(9*ones(500,10));
    
% Generalize the feature vector

load DecisionValue_Source.mat
load DecisionValue_Probability.mat
Scores_Normalized = [];
for i = 1:500
[y,ps] = mapminmax(ClassifyScores(i,:));   
ps.ymin = 0;      
[y,ps] = mapminmax(ClassifyScores(i,:),ps);
Scores_Normalized = [Scores_Normalized;y];
end

% Compute the similiarity value between each source images and the input
% image.
% We have tried many ways of distance and possible combination of values generated 
% from the support vector machine, which have been commented.
% Finally we found that the combination of classify scores and probability
% reaches minimum result. And the factor are both 0.5.

for i = 1:500
    %scores(i,1) = pdist2(decision_values_test,DecisionValue(i,:));
%     c = [decision_values_test;DecisionValue(i,:)];
%     scores(i,1) = pdist(c,'cosine');
    %scores(i,1) = HistogramIntersection(decision_values_test',DecisionValue(i,:)');
%     c = [decision_values_test;DecisionValue(i,:)];
%     scores(i,1) = pdist(c, 'cityblock');
% scores(i,1) = pdist2(classify_score_test,ClassifyScores(i,:));
%     c = [classify_score_test;ClassifyScores(i,:)];  %m   
%     scores(i,1) = pdist(c,'cosine');
% scores(i,1) = HistogramIntersection(classify_score_test',ClassifyScores(i,:)');
%     scores(i,1) = pdist2(classify_label_test,ClassifyLabels(i,:));
% c = [classify_label_test;ClassifyLabels(i,:)];
% scores(i,1) = pdist(c,'cosine');
%scores(i,1) = HistogramIntersection(classify_label_test',ClassifyLabels(i,:)');
% scores(i,1) = pdist2(FinalScores_test,FinalScores(i,:));
% c = [FinalScores_test;FinalScores(i,:)];
% scores(i,1) = pdist(c,'cosine');
% scores(i,1) = pdist2(DecisionValue_Probability_Test,DecisionValue_Probability(i,:));
% c = [[DecisionValue_Probability_Test classify_score_test];[DecisionValue_Probability(i,:) Scores_Normalized(i,:)]];
% c1 = [DecisionValue_Probability_Test;DecisionValue_Probability(i,:)]; %m
% c2 = [classify_score_test_Normalized;Scores_Normalized(i,:)];
% scores(i,1) = 0.3*pdist(c1,'cosine')+0.7*pdist(c2,'cosine');
c1 = [DecisionValue_Probability_Test;DecisionValue_Probability(i,:)];
c2 = [classify_score_test;ClassifyScores(i,:)];
%c3 = [classify_label_test_Normalized;ClassifyLabels_Normalized(i,:)];
%c2 = [FinalScores_test;FinalScores(i,:)];
scores(i,1) = 0.5*pdist(c1,'cosine')+0.5*pdist(c2,'cosine');%+0.3*pdist(c3,'cosine');

index = zeros(500,1);
for i = 1:500
index(i,1) = i;
end

% Sort the result and get the top 20 images.

result = [scores index];
[resultsort,~] = sortrows(result,1);
RetrievalResultTop20 = resultsort(1:20,2);

% It is the test code for retrieval visualization during the development.
% That makes us evaluate the performance of an algorithm directly.
% However it is not in use now. Never mind them.

% figure;
% I = imread([str,num2str(ImageId),'.jpg']);
% I = imresize(I, [300 300]);
% imshow(I);
% title('query image');
% 
% figure;
% title('search result');
% for i = 1:20
%     RetrievalID = RetrievalResultTop20(i,1);
%     I_Result = imread([str_Source,num2str(RetrievalID),'.jpg']);
%     I_Result = imresize(I_Result, [200 200]);
%     subplot(4,5,i);
%     imshow(I_Result);
%     title(['score= ',num2str(100*(1-resultsort(i,1)))]);
% end
end
end


if type == 2 %convolution neural network
    run ./matconvnet-1.0-beta17/matlab/vl_setupnn
    load CNNFeature.mat;
    str = 'Corel_Test/';
    pretrained_net = load('imagenet-vgg-f.mat');
    scores_SVM = zeros(500,1);
    scores = zeros(500,1);
%     I = imread([str,num2str(ImageId),'.jpg']);
    %I = rgb2gray(I);
    I = single(repmat(I,[1 1 3]));
    I = imresize(I,[224 224]);
    I = I - pretrained_net.meta.normalization.averageImage; % Compute the difference between the input image and averageimage of the pre-trained network.
    res = vl_simplenn(pretrained_net,I) ;
    CNNFeature_test = res(20).x; % Get the output of the 20th layer of CNN as the feature output.
    CNNFeature_test = CNNFeature_test(:)';
    CNNFeature_test = CNNFeature_test*coeff_CNN(:, 1:128);
     if(sqrt(CNNFeature_test*CNNFeature_test')~=0)
     CNNFeature_test = CNNFeature_test./(sqrt(CNNFeature_test*CNNFeature_test'));
     end
     
     load CNNFeature.mat

     % Use pre-trained support vector machine to determine which classes
     % the input image belongs to.
     % Get the generalized decision probability as the feature vector.
     ktest = zeros(1,500);
    for i = 1:500
        ktest(1,i) = Hellinger(CNNFeature_test,Feature_CNN(i,:)); % Use the Hellinger kernel.
    end
    load SVM_Model_CNN.mat
    Ktest = [(1:1)', ktest];
    testing_label_vector = ones(1,1);
    [predicted_label, accuracy, decision_values] = libsvmpredict(testing_label_vector, Ktest, SVM_Model_CNN,'-b 1');
    DecisionValue_Probability_Test_CNN = decision_values;
    load DecisionValue_Probability_CNN.mat
    
    clear i
    
for i = 1:500
    %scores(i,1) = 100-CNNFeature_test*Feature_CNN(i,:)';
%     c = [CNNFeature_test;Feature_CNN(i,:)];
    c = [DecisionValue_Probability_Test_CNN;DecisionValue_Probability_CNN(i,:)];
    scores_SVM(i,1) = pdist(c,'cosine');
end

    
    
%     [~, index] = sort(score, 'descend');
% rank_image_ID = index;
% RetrievalResultTop20 = rank_image_ID(1:20,1);
% resultsort = zeros(500,1);
    
    index = zeros(500,1);
    
for i = 1:500
index(i,1) = i;
end

% Get the top 20 images.

result = [scores_SVM index];
[resultsort,~] = sortrows(result,1);
%resultsort = flip(resultsort);
RetrievalResultTop20 = resultsort(1:20,2);
clear i

% If the smallest cosine distance between feature vectors of target image and source image
% doesn't reach a reasonable threshold, we may assume that the pre-trained
% support vector machine misclassify the image. And we'll just use the
% output vector of convolution neural network as feature vectors to index 
% similarity between two images.
% The combination of the two methods significantly increase the 
if 100*(1-resultsort(1,1))<95
    for i = 1:500
    %scores(i,1) = 100-CNNFeature_test*Feature_CNN(i,:)';
    c = [CNNFeature_test;Feature_CNN(i,:)];
    %c = [DecisionValue_Probability_Test_CNN;DecisionValue_Probability_CNN(i,:)];
    scores(i,1) = pdist(c,'cosine');
    end
result = [scores index];
[resultsort,~] = sortrows(result,1);
%resultsort = flip(resultsort);
RetrievalResultTop20 = resultsort(1:20,2);
end
    
end



end

