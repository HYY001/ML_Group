function p = predictOneVsAll(all_theta,X)

m = size(X,1);
num_labels = size(all_theta,1);

p = zeros(size(X,1),1);

X= [ones(m,1) X];
%A:m*n����
%A = max[A,[],2]����A��ÿһ�е����ֵ������m*1����
%[c,i] = max{A,[],2] cΪÿһ�����ֵ��iΪ���ֵ���к�
%oneVsAll����all_theta��X*all_theta
%all_theta:10*401���� X:5000*401

%[c,i] = max(all_theta*X', [], 2);  ��ex3��y����ά�Ȳ���Ӧ
[c,i] = max(X*all_theta',[],2);
p = i;


end