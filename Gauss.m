function [ A,x ] = Gauss( A, b )
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
% 顺序Gauss消去法（无行交换）解线性方程组Ax = b
% Gauss( A, b )，A为矩阵系数，b为右端列向量，x为解向量
 n = length(b);
 A = [A, b];
% 消元
for k = 1: (n-1)
    A((k+1):n, (k+1):(n+1)) = A((k+1):n, (k+1):(n+1)) - A((k+1):n, k)/A(k,k)*A(k,(k+1):(n+1));
    A((k+1):n, k) = zeros(n-k, 1);
    A;
end

% 回代
x = zeros(n,1);
x(n) = A(n,n+1)/A(n,n);
for k = (n-1) : -1 : 1
    x(k,:) = (A(k,n+1) - A(k, (k+1):n))*x((k+1):n)/A(k,k);
end

end

