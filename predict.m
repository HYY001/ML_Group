function p = predict(Theta1,Theta2,X)

m = size(X,1);
num_labels = size(Theta2,1);

p = zeros(size(X,1),1); %5000*1
%theta1:25*401
%theta2:10*26
%X:5000*400
X = [ones(m,1) X]; %5000*401
tem1 = Theta1*X';   %25*5000
a1 = sigmoid(tem1);%25*5000
a1 = [ones(1,m);a1];%26*5000
a2 = Theta2*a1;    %10*5000
a3 = sigmoid(a2);   %10*5000
[c,i] = max(a3',[],2);
p = i;

end