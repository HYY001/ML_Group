clc;
clear all;
close all;

[x1,x2] = meshgrid(linspace(-5,5,100),linspace(-5,5,100));


X = [x1(:) x2(:)];
%MU = [0,0];
%SIGMA = [2 0;0 4];
MU = zeros(1,2);
SIGMA = zeros(2,2);
MU(1,1) = input('Enter the first average value:');
MU1(1,2) = input('Enter the second average value:');
SIGMA(1,1) = input('Enter the first variance:');
SIGMA(2,2) = input('Enter the second variance:');
Y = mvnpdf(X,MU,SIGMA);
P = reshape(Y,size(x1));
figure;
surfc(x1, x2, P);
figure;
contour(x1,x2,P);