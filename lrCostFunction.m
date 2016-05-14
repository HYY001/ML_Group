function[J,grad] = lrCostFunction(theta,X,y,lambda)

m = length(y);
J = 0;
grad = zeros(size(theta));
% A(:, 2:end) will only return elements 
%from the 2nd to last column of A.


h = sigmoid(X*theta);
a = [0;theta(2:end)];       %400*1
J = -1/m*sum(y.*log(h)+(1-y).*log(1-h))+lambda/(2*m)*(a' * a);%a'*a ·µ»ØÒ»¸ö1*1¾ØÕó

grad = (1/m)*(X'*(h - y))+lambda/m*a;
%X:5000*400   h-y:5000*1   a:400*1

grad = grad(:);
end