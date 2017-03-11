function [ cluster,label] = Kmeans( trainset,center)
% ECE 6258 course project
% Georgia Institue of Technology
% modified by Xie Yi in 10/30/2016

% This funtion trains the input data, to classify them into K classes,
% which are used in the Bag-of-Words Model.
% Trainset is the input data, each column represents a space point.
% Center is the initial center of classes, each column represents a
% center.
% Cluster is the final center of classes, each column represents a center.
% Label is the label of the input data, the value of each column represents
% which class the column belongs to in input data.

% Set the initial value of error and iteration times
[l,N]=size(trainset);
[l,m]=size(center);
error=inf;
J=inf;
iter=0;
converge=0;
label = zeros(1,N);

% Iteration until reaching the maximum times or the error became small
% enough.
% Found which center the point belongs to for each point.
while (iter<500 && converge==0)
    fprintf('It is the %dth iteration\n ',iter+1);
    iter = iter+1;
    for i = 1:N
        dist = sum((trainset(:,i)*ones(1,m) - center).^2,1);
        [~,nearest] = min(dist);
        label(1,i) = nearest;
    end

% Calcualte the new cluster centers.
    for i = 1:m
        Xi = trainset(:,find(label==i));
        [~,Ni] = size(Xi);
        center(:,i) = sum(Xi,2)/Ni;
    end
    
% Determine whether convergence have been reached.
    J_old = J;
    J = 0;
    for i = 1:N
        J = J+sum((trainset(:,i)-center(:,label(1,i))).^2,1);
    end
    error = abs(J-J_old);
    fprintf('error = %8.5f ',error);
    if(error<1e-15)
        converge = 1;
    else
        converge = 0;
    end
end
    cluster = center;
end