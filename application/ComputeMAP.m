function [ MAP,MAP_average ] = ComputeMAP()
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% The function computes the mean average precision of top 20 results of
% image retrieval.
% Note that the function is just for the justification of image retrieval
% ways by us. If you want to use the function, you must use function 
% [RetrievalResultTop20] = TestRetrieval(ImageId,type),and comment the
% line [RetrievalResultTop20,resultsort] = TestRetrieval(I,type).
% When trying to evaluate precision of results using different ways, we
% have included the draft of original data below.

% MAP = 0.71797 begin (pdist2)
% MAP = 0.72739 cos
% MAP = 0.70412 block
% MAP = 0.72111 scores pdist2
% MAP = 0.72951 cos scores 0.6050    0.7041    0.5893    0.9185    1.0000    0.6871    0.7802    0.8150    0.5245    0.6714
% MAP = 0.71465 final scores
% MAP = 0.77083(16) prop pdist2 0.6397    0.7396    0.6874    0.8932    1.0000    0.7374    0.7653    0.8603    0.5667    0.8187
% MAP = 0.78424 cos 0.6625    0.7521    0.6932    0.9083    1.0000    0.7934    0.7626    0.8633    0.5929    0.8141
% MAP = 0.78834 0.5/0.5 normalized scores + prop 0.6667    0.7721    0.6929    0.9103    1.0000    0.8020    0.7673    0.8646    0.5948    0.8127
% MAP = 0.79112 0.7/0.3 0.6774    0.7774    0.6849    0.9129    1.0000    0.8089    0.7697    0.8652    0.5966    0.8182
% MAP = 0.79287 0.5/0.5 scores + prop 0.6900    0.7877    0.6793    0.9142    1.0000    0.8166    0.7694    0.8621    0.5972    0.8122
% MAP = 8.0114  CNN 0.7032    0.5840    0.8165    1.0000    1.0000    0.9595    0.8974    0.6235    0.8759    0.5514
% MAP = 0.794 CNN+SVM 0.8400  +  0.6800   + 0.9000  +  1.0000   + 1.0000   + 0.8400  +  0.7600  +  0.6000  +  0.9000 +   0.4200
% MAP = 0.83138 CNN+SVM/only CNN 0.8521    0.6710    0.8824    1.0000    1.0000    0.9500    0.8774    0.6457    0.9093    0.5259


clear all;
clc;
close all;

% load the original result vector of MAP, each element in the result vector
% will represents the precision of a class.
type = 2;
MAP = zeros(1,10);
str = 'Corel_Test\';
precision = zeros(500,16);
precision_singleImage = zeros(500,1);

% Evaluate the precision for all 10 classes. It computes top 20 precision
% because we display first 20 results in the GUI.
for i = 1:10
    for j = ((i-1)*50+1):(i*50)
        fprintf('Processing the %dth image\n ',j);
        ImageId = j;
        RetrievalResultTop20 = TestRetrieval(ImageId,type);
        correct = 0;
        for k = 1:20
            if RetrievalResultTop20(k,1) >((i-1)*50) && RetrievalResultTop20(k,1)<(i*50+1)
            correct = correct+1;
            end
            precision(j,k) = correct/k;
        end
    end
end

for i = 1:500
precision_singleImage(i,1) = mean(precision(i,:));
end

clear i;

% Compute precision for each class.
for i = 1:10
MAP(1,i) = mean(precision_singleImage(((i-1)*50+1):(i*50),:));
end

% Compute average MAP for all images.
MAP_average = mean(MAP);



end

