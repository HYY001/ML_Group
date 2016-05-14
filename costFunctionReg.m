function[J,grad] = costFunctionReg(theta,X,y,lambda)

J = 0;
grad = zeros(size(theta));
m = length(y);

h = sigmoid(X*theta);
J = 1/m*sum(-y.*log(h)-(1-y).*log(1-h))+lambda/(2*m)*sum(theta.*theta);

temp = repmat(h-y,1,size(X,2));
grad = 1/m*sum(temp.*X)'+lambda/m.*theta;

end