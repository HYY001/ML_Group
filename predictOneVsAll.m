function p = predictOneVsAll(all_theta,X)

m = size(X,1);
num_labels = size(all_theta,1);

p = zeros(size(X,1),1);

X= [ones(m,1) X];
%A:m*n矩阵
%A = max[A,[],2]返回A中每一行的最大值，返回m*1矩阵
%[c,i] = max{A,[],2] c为每一行最大值，i为最大值的列号
%oneVsAll返回all_theta，X*all_theta
%all_theta:10*401矩阵 X:5000*401

%[c,i] = max(all_theta*X', [], 2);  与ex3中y矩阵维度不对应
[c,i] = max(X*all_theta',[],2);
p = i;


end