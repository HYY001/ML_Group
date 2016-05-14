function p = predict(theta,X)

m = size(X,1);
p = zeros(m,1);

A = sigmoid(X*theta);
if A>0.5
   p=1;
else
   p=0;
end


end
