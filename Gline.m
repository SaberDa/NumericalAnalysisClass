function [ x_star, k ] = Gline( f, x0, x1, e, Nmax )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% 用双店割线法解非线性方程f(x) = 0
% Gline( fun, x0, x1, ep, Nmax ) fun表示f(x)，x0，x1为迭代初值
% ep为精度（默认值为1e-5），x返回解
% k为迭代上限次数以防发散

if nargin < 5
    Nmax = 500;
end

if nargin < 4
    e = 1e-5;
end

y = x0;
x = x1;
k = 0;

while abs(x-y)>e & k < Nmax
    k = k + 1;
    z=x-(feval(f,x)*(x-y))/(feval(f,x)-feval(f,y));
    y=x;
    x=z;
end

x_star = x1;

if k == Nmax
    warning('已迭代上限次数');
end

end

