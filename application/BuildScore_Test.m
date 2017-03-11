% ECE 6258 course project
% Georgia Institue of Technology
% It is a test file to evaluate scores of target images after being
% classified by vector support machine.

class = zeros(500,1);
for i = 1:500
[row column] = find(ClassifyScores(i,:)==max(ClassifyScores(i,:)));
class(i,1) = column;
end
for i = 1:10

true = zeros(1,10);
for i = 1:10
for j = ((i-1)*50+1):(i*50)
if class(j,1)==i
true(1,i) = true(1,i)+1;
end
end
end
classcount = zeros(500,10);

for i = 1:500
if DecisionValue(i,1)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,2) = classcount(i,2)+1;
end
if DecisionValue(i,2)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,3) = classcount(i,3)+1;
end
if DecisionValue(i,3)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,4) = classcount(i,4)+1;
end
if DecisionValue(i,4)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,5) = classcount(i,5)+1;
end
if DecisionValue(i,5)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,6) = classcount(i,6)+1;
end
if DecisionValue(i,6)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,7) = classcount(i,7)+1;
end
if DecisionValue(i,7)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,8)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,9)>0
classcount(i,1) = classcount(i,1)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,10)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,3) = classcount(i,3)+1;
end
if DecisionValue(i,11)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,4) = classcount(i,4)+1;
end
if DecisionValue(i,12)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,5) = classcount(i,5)+1;
end
if DecisionValue(i,13)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,6) = classcount(i,6)+1;
end
if DecisionValue(i,14)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,7) = classcount(i,7)+1;
end
if DecisionValue(i,15)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,16)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,17)>0
classcount(i,2) = classcount(i,2)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,18)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,4) = classcount(i,4)+1;
end
if DecisionValue(i,19)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,5) = classcount(i,5)+1;
end
if DecisionValue(i,20)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,6) = classcount(i,6)+1;
end
if DecisionValue(i,21)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,7) = classcount(i,7)+1;
end
if DecisionValue(i,22)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,23)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,24)>0
classcount(i,3) = classcount(i,3)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,25)>0
classcount(i,4) = classcount(i,4)+1;
else
classcount(i,5) = classcount(i,5)+1;
end
if DecisionValue(i,26)>0
classcount(i,4) = classcount(i,4)+1;
else
classcount(i,6) = classcount(i,6)+1;
end
if DecisionValue(i,27)>0
classcount(i,4) = classcount(i,4)+1;
else
classcount(i,7) = classcount(i,7)+1;
end
if DecisionValue(i,28)>0
classcount(i,4) = classcount(i,4)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,29)>0
classcount(i,4) = classcount(i,4)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,30)>0
classcount(i,4) = classcount(i,4)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,31)>0
classcount(i,5) = classcount(i,5)+1;
else
classcount(i,6) = classcount(i,6)+1;
end
if DecisionValue(i,32)>0
classcount(i,5) = classcount(i,5)+1;
else
classcount(i,7) = classcount(i,7)+1;
end
if DecisionValue(i,33)>0
classcount(i,5) = classcount(i,5)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,34)>0
classcount(i,5) = classcount(i,5)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,35)>0
classcount(i,5) = classcount(i,5)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,36)>0
classcount(i,6) = classcount(i,6)+1;
else
classcount(i,7) = classcount(i,7)+1;
end
if DecisionValue(i,37)>0
classcount(i,6) = classcount(i,6)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,38)>0
classcount(i,6) = classcount(i,6)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,39)>0
classcount(i,6) = classcount(i,6)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,40)>0
classcount(i,7) = classcount(i,7)+1;
else
classcount(i,8) = classcount(i,8)+1;
end
if DecisionValue(i,41)>0
classcount(i,7) = classcount(i,7)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,42)>0
classcount(i,7) = classcount(i,7)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,43)>0
classcount(i,8) = classcount(i,8)+1;
else
classcount(i,9) = classcount(i,9)+1;
end
if DecisionValue(i,44)>0
classcount(i,8) = classcount(i,8)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
if DecisionValue(i,45)>0
classcount(i,9) = classcount(i,9)+1;
else
classcount(i,10) = classcount(i,10)+1;
end
end

 class1 = zeros(500,1);
for i = 1:500
[row column] = find(classcount(i,:)==max(classcount(i,:)));
class1(i,1) = column(:,1);
end
true1 = zeros(1,10);
for i = 1:10
for j = ((i-1)*50+1):(i*50)
if class1(j,1)==i
true1(1,i) = true1(1,i)+1;
end
end
end