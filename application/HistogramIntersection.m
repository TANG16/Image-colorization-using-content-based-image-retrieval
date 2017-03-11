function [ distance ] = HistogramIntersection( w1,w2 )
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 10/30/2016

% This fungtion caulates the histogram intersection distance between two 
% vectors
% w1,w2 are two vectors with same dimensions

% Calculate the histogram intersection distance
sum1 = 0;
distance = 0;
[row,~] = size(w1);
for i = 1:row
    sum1 = sum1+min(w1(i,1),w2(i,1));
end
sum2 = min(sum(w1),sum(w2));
distance = 1-sum1./sum2;

end