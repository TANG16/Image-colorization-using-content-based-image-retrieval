function [ dist ] = Hellinger( w1,w2 )
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 11/26/2016

% It is the function to compute hellinger distance between two vectors.
% It is the helper function for training of support vector machine because
% we need hellinger kernel in the implentation of the project.

[~,column] = size(w1);
dist = 0;

for i = 1:column
    dist = dist + sqrt(w1(1,i).*w2(1,i));
end


end

