function [] = BuildWordBag()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% This function builds wordbag for each image in our source image dataset.
% The wordbag can be viewed as the feature of a natural image after we have
% obtained the cluster centers of its interest points.
% For each interest points of an image we determine which "word" its each
% interest point belongs to.
% Finally we get a histogram which represents the frequency of "words" of
% an image. And we generalize the histogram. It can be considered as the
% "wordbag" of the image, which can be used to index similarity between two
% images.
% The function produce a FeatureWordBag.mat file which contains a matrix, 
% each column of which represents the frequency histogram for "words" of
% a single image. 

clear all;
clc;
close all;

% load the obtained dictionary and build the wordbag for each image
load FeatureDictionary.mat;
WordBag_Global = zeros(200,500);
WordBag_Local = zeros(200,500);
WordBagForEachImage_Global = cell(1,500);
WordBagForEachImage_Local = cell(1,500);

%IDFVector = zeros(100,1);

for i = 1:500
WordBagForEachImage_Global{i} = DictionaryLabels_Global(:,((i-1)*950+1):(i*950));
WordBagForEachImage_Local{i} = DictionaryLabels_Local(:,((i-1)*345+1):(i*345));
end

% for i = 1:100
%     number = 0;
%     for j = 1:100
%         if(~isempty(find(WordBagForEachImage{j}==i)))
%             number = number+1;
%         end
%         if j == 100
%             IDFVector(i,1) = number;
%         end
%     end
% end
% 
% for i = 1:100
%     IDFVector(i,1) = log10(100/(IDFVector(i,1)+1));
% end

clear i 

for i = 1:500
    fprintf('Building wordbag for the %dth image\n ',i);
    for j = 1:200
        [~,Ni_Global] = size(find(WordBagForEachImage_Global{i}==j));
        [~,Ni_Local] = size(find(WordBagForEachImage_Local{i}==j));
        WordBag_Global(j,i) = Ni_Global;
        WordBag_Local(j,i) = Ni_Local;
    end
end

clear i j

WordBag_Normalized = [WordBag_Global;WordBag_Local];
WordBag_Normalized = WordBag_Normalized./(1295*ones(400,500));
WordBag_Normalized = WordBag_Normalized';

% for i = 1:100
%     WordBag(:,i) = WordBag(:,i).*IDFVector;
% end

% % normalize the historgram using L2 norm
% for i = 1:100
% WordBag(:,i) = L2_Normalize(WordBag(:,i));
% end

% Save the wordbag file
save('WordBag.mat','WordBag_Global','WordBag_Local','WordBag_Normalized');

 clear all;
 clc;
 close all;

end