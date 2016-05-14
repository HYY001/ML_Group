function[J,grad] = costFunction(theta,X,y)

m = length(y);
J = 0;
grad = zeros(size(theta));

h1 = sigmoid(X*theta);
h2 = 1 - h1;
J = 1/m*sum(-y.*log(h1)-(1-y).*log(h2));

%存在三个参数，应该有三个theta
temp= repmat(h1-y,1,size(X,2));
grad = 1/m*sum(temp.*X);
%grad = 1/m*sum((h1-y).*X)';
end