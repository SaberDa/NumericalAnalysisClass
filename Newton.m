function [ x_star,k ] = Newton( fname, fdname, x0, ep, Nmax )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
% 用牛顿法解非线性方程f(x) = 0
% Newton( fname, fdname, x0, ep, Nmax)fname，fdname分别为f(x)及其导数
% x0为迭代初值，ep为精度（默认值为1e-5）
% x返回解，Nmax为迭代上限次数以防发散（默认值为500）
if nargin < 5
    Nmax = 500;
end

if nargin < 4
    ep = 1e-5;
end

x = x0;
x0 = x + 2*ep;
k = 0;

while abs(x0-x)>ep & k < Nmax
    k = k + 1;
    x0 = x;
    x = x0 - feval(fname, x0)/feval(fdname, x0);
end

x_star = x;

if k == Nmax
    warning('已迭代上限次数');
end

end

