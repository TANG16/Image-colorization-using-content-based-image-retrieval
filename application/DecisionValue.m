function [] = DecisionValue()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% The function computes the decision value of each source image.
% The trained support vector machine computes the probability of each image
% about which class it belongs to, and we record the probability for each
% image, store them in the mat file.
% By changing value of type we can determine the retrieval method we use,
% dense-SIFT+wordbag or neural network.
% We have tried different methods to determine which value is optimal to
% index similiarity between two images after trained by support vector
% machine. Finally we found that combining feature vector of probability
% and scores reachs optimal precision.
% The generating code of scores has been commented but we have used this
% during our project. We make use of output of support vector machine, the
% SVM contains 45 different one-to-one classifier. Each image is
% represented using a 10-dimension vector, each element of which stands for
% the "score", which is the sum of scores of 9 classifier of the class. 
% The score will be higher when the image has more possibility to belong 
% to the class.

clear all;
clc;
close all;

% Determine the type we use, type 1 stands for the dense-SIFT+wordbag, type
% 2 stands for the neural network.
type = 2;
if(type == 1) 
DecisionValue = zeros(500,45);
ClassifyScores = zeros(500,10);
ClassifyLabels = zeros(500,10);
ClassifySupportScores = zeros(500,10);
FinalScores = zeros(500,10);
DecisionValue_Probability = [];

% Use pre-trained support vector machine model to get the probability.
load WordBag.mat
load SVM_Model.mat
ktest = zeros(1,500);
for i = 1:500
    fprintf('Processing the %dth image\n ',i);
    FeatureVector_Normalized = WordBag_Normalized(i,:);
    for j = 1:500
        ktest(1,j) = Hellinger(FeatureVector_Normalized,WordBag_Normalized(j,:));
    end
Ktest = [(1:1)', ktest];
testing_label_vector = ones(1,1);
[predicted_label, accuracy, decision_values] = libsvmpredict(testing_label_vector, Ktest, SVM_Model,'-b 1');
%DecisionValue(i,:) = decision_values;
DecisionValue_Probability = [DecisionValue_Probability;decision_values];
end

% for i = 1:500
%     ClassifyScores(i,1) = DecisionValue(i,1)+DecisionValue(i,2)+DecisionValue(i,3)+DecisionValue(i,4)+DecisionValue(i,5)+DecisionValue(i,6)+DecisionValue(i,7)...
%         +DecisionValue(i,8)+DecisionValue(i,9);
%     ClassifyScores(i,2) = -DecisionValue(i,1)+DecisionValue(i,10)+DecisionValue(i,11)+DecisionValue(i,12)+DecisionValue(i,13)+DecisionValue(i,14)+DecisionValue(i,15)...
%         +DecisionValue(i,16)+DecisionValue(i,17);
%     ClassifyScores(i,3) = -DecisionValue(i,2)-DecisionValue(i,10)+DecisionValue(i,18)+DecisionValue(i,19)+DecisionValue(i,20)+DecisionValue(i,21)+DecisionValue(i,22)...
%         +DecisionValue(i,23)+DecisionValue(i,24);
%     ClassifyScores(i,4) = -DecisionValue(i,3)-DecisionValue(i,11)-DecisionValue(i,18)+DecisionValue(i,25)+DecisionValue(i,26)+DecisionValue(i,27)+DecisionValue(i,28)...
%         +DecisionValue(i,29)+DecisionValue(i,30);
%     ClassifyScores(i,5) = -DecisionValue(i,4)-DecisionValue(i,12)-DecisionValue(i,19)-DecisionValue(i,25)+DecisionValue(i,31)+DecisionValue(i,32)+DecisionValue(i,33)...
%         +DecisionValue(i,34)+DecisionValue(i,35);
%     ClassifyScores(i,6) = -DecisionValue(i,5)-DecisionValue(i,13)-DecisionValue(i,20)-DecisionValue(i,26)-DecisionValue(i,31)+DecisionValue(i,36)+DecisionValue(i,37)...
%         +DecisionValue(i,38)+DecisionValue(i,39);
%     ClassifyScores(i,7) = -DecisionValue(i,6)-DecisionValue(i,14)-DecisionValue(i,21)-DecisionValue(i,27)-DecisionValue(i,31)-DecisionValue(i,36)+DecisionValue(i,40)...
%         +DecisionValue(i,41)+DecisionValue(i,42);
%     ClassifyScores(i,8) = -DecisionValue(i,7)-DecisionValue(i,15)-DecisionValue(i,22)-DecisionValue(i,28)-DecisionValue(i,32)-DecisionValue(i,37)-DecisionValue(i,40)...
%         +DecisionValue(i,43)+DecisionValue(i,44);
%     ClassifyScores(i,9) = -DecisionValue(i,8)-DecisionValue(i,16)-DecisionValue(i,23)-DecisionValue(i,29)-DecisionValue(i,33)-DecisionValue(i,38)-DecisionValue(i,41)...
%         -DecisionValue(i,43)+DecisionValue(i,45);
%     ClassifyScores(i,10) = -DecisionValue(i,9)-DecisionValue(i,17)-DecisionValue(i,24)-DecisionValue(i,30)-DecisionValue(i,34)-DecisionValue(i,39)-DecisionValue(i,42)...
%         -DecisionValue(i,44)-DecisionValue(i,45);
% end
% clear i
% 
% for i = 1:500
% if DecisionValue(i,1)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,1);
% else
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)-DecisionValue(i,1);
% end
% if DecisionValue(i,2)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,2);
% else
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)-DecisionValue(i,2);
% end
% if DecisionValue(i,3)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,3);
% else
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)-DecisionValue(i,3);
% end
% if DecisionValue(i,4)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,4);
% else
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)-DecisionValue(i,4);
% end
% if DecisionValue(i,5)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,5);
% else
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)-DecisionValue(i,5);
% end
% if DecisionValue(i,6)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,6);
% else
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)-DecisionValue(i,6);
% end
% if DecisionValue(i,7)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,7);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,7);
% end
% if DecisionValue(i,8)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,8);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,8);
% end
% if DecisionValue(i,9)>0
% ClassifyLabels(i,1) = ClassifyLabels(i,1)+1;
% ClassifySupportScores(i,1) = ClassifySupportScores(i,1)+DecisionValue(i,9);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,9);
% end
% if DecisionValue(i,10)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,10);
% else
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)-DecisionValue(i,10);
% end
% if DecisionValue(i,11)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,11);
% else
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)-DecisionValue(i,11);
% end
% if DecisionValue(i,12)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,12);
% else
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)-DecisionValue(i,12);
% end
% if DecisionValue(i,13)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,13);
% else
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)-DecisionValue(i,13);
% end
% if DecisionValue(i,14)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,14);
% else
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)-DecisionValue(i,14);
% end
% if DecisionValue(i,15)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,15);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,15);
% end
% if DecisionValue(i,16)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,16);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,16);
% end
% if DecisionValue(i,17)>0
% ClassifyLabels(i,2) = ClassifyLabels(i,2)+1;
% ClassifySupportScores(i,2) = ClassifySupportScores(i,2)+DecisionValue(i,17);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,17);
% end
% if DecisionValue(i,18)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,18);
% else
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)-DecisionValue(i,18);
% end
% if DecisionValue(i,19)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,19);
% else
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)-DecisionValue(i,19);
% end
% if DecisionValue(i,20)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,20);
% else
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)-DecisionValue(i,20);
% end
% if DecisionValue(i,21)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,21);
% else
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)-DecisionValue(i,21);
% end
% if DecisionValue(i,22)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,22);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,22);
% end
% if DecisionValue(i,23)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,23);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,23);
% end
% if DecisionValue(i,24)>0
% ClassifyLabels(i,3) = ClassifyLabels(i,3)+1;
% ClassifySupportScores(i,3) = ClassifySupportScores(i,3)+DecisionValue(i,24);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,24);
% end
% if DecisionValue(i,25)>0
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)+DecisionValue(i,25);
% else
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)-DecisionValue(i,25);
% end
% if DecisionValue(i,26)>0
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)+DecisionValue(i,26);
% else
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)-DecisionValue(i,25);
% end
% if DecisionValue(i,27)>0
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)+DecisionValue(i,27);
% else
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)-DecisionValue(i,27);
% end
% if DecisionValue(i,28)>0
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)+DecisionValue(i,28);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,28);
% end
% if DecisionValue(i,29)>0
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)+DecisionValue(i,29);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,29);
% end
% if DecisionValue(i,30)>0
% ClassifyLabels(i,4) = ClassifyLabels(i,4)+1;
% ClassifySupportScores(i,4) = ClassifySupportScores(i,4)+DecisionValue(i,30);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,30);
% end
% if DecisionValue(i,31)>0
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)+DecisionValue(i,31);
% else
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)-DecisionValue(i,31);
% end
% if DecisionValue(i,32)>0
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)+DecisionValue(i,32);
% else
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)-DecisionValue(i,32);
% end
% if DecisionValue(i,33)>0
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)+DecisionValue(i,33);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,33);
% end
% if DecisionValue(i,34)>0
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)+DecisionValue(i,34);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,34);
% end
% if DecisionValue(i,35)>0
% ClassifyLabels(i,5) = ClassifyLabels(i,5)+1;
% ClassifySupportScores(i,5) = ClassifySupportScores(i,5)+DecisionValue(i,35);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,35);
% end
% if DecisionValue(i,36)>0
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)+DecisionValue(i,36);
% else
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)-DecisionValue(i,36);
% end
% if DecisionValue(i,37)>0
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)+DecisionValue(i,37);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,37);
% end
% if DecisionValue(i,38)>0
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)+DecisionValue(i,38);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,38);
% end
% if DecisionValue(i,39)>0
% ClassifyLabels(i,6) = ClassifyLabels(i,6)+1;
% ClassifySupportScores(i,6) = ClassifySupportScores(i,6)+DecisionValue(i,39);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,39);
% end
% if DecisionValue(i,40)>0
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)+DecisionValue(i,40);
% else
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)-DecisionValue(i,40);
% end
% if DecisionValue(i,41)>0
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)+DecisionValue(i,41);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,41);
% end
% if DecisionValue(i,42)>0
% ClassifyLabels(i,7) = ClassifyLabels(i,7)+1;
% ClassifySupportScores(i,7) = ClassifySupportScores(i,7)+DecisionValue(i,42);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,42);
% end
% if DecisionValue(i,43)>0
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)+DecisionValue(i,43);
% else
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)-DecisionValue(i,43);
% end
% if DecisionValue(i,44)>0
% ClassifyLabels(i,8) = ClassifyLabels(i,8)+1;
% ClassifySupportScores(i,8) = ClassifySupportScores(i,8)+DecisionValue(i,44);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,44);
% end
% if DecisionValue(i,45)>0
% ClassifyLabels(i,9) = ClassifyLabels(i,9)+1;
% ClassifySupportScores(i,9) = ClassifySupportScores(i,9)+DecisionValue(i,45);
% else
% ClassifyLabels(i,10) = ClassifyLabels(i,10)+1;
% ClassifySupportScores(i,10) = ClassifySupportScores(i,10)-DecisionValue(i,45);
% end
% end
% 
% clear i
% for i = 1:500
%     for j = 1:10
%         if(ClassifyLabels(i,j)~=0)
%         FinalScores(i,j) = ClassifySupportScores(i,j)/(2*ClassifyLabels(i,j)) + ClassifyLabels(i,j)/18;
%         else
%         FinalScores(i,j) = 0;
%         end
%     end
%     end
% 
% save('DecisionValue_Source.mat','DecisionValue','ClassifyScores','ClassifyLabels','ClassifySupportScores','FinalScores');

save('DecisionValue_Probability.mat','DecisionValue_Probability');

end

if(type == 2)
    
DecisionValue_Probability_CNN = [];


% Use pre-trained support vector machine model to get the probability.
load CNNFeature.mat
load SVM_Model_CNN.mat
ktest = zeros(1,500);
for i = 1:500
    fprintf('CNN Processing the %dth image\n ',i);
    FeatureVector_Normalized = Feature_CNN(i,:);
    for j = 1:500
        ktest(1,j) = Hellinger(FeatureVector_Normalized,Feature_CNN(j,:));
    end
Ktest = [(1:1)', ktest];
testing_label_vector = ones(1,1);
[predicted_label, accuracy, decision_values] = libsvmpredict(testing_label_vector, Ktest, SVM_Model_CNN,'-b 1');
%DecisionValue(i,:) = decision_values;
DecisionValue_Probability_CNN = [DecisionValue_Probability_CNN;decision_values];
end

save('DecisionValue_Probability_CNN.mat','DecisionValue_Probability_CNN');

end

end

