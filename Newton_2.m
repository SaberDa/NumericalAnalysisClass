function [ x_star, index, k ] = Newton_2( fun, x, ep, Nmax )
%NEWTON_2 Summary of this function goes here
%   Detailed explanation goes here
% fun(x)为迭代函数，x为初始值，ep为精度（默认值为1e-5）
% 当迭代成功时x_star为方程的根，当迭代失败时输出最后的迭代值
% index = 1表示迭代成功，index = 0表示迭代失败

if nargin < 4
    Nmax = 500;
end

if nargin < 5
    ep = 1e-5;
end

index = 0;
k = 1;

while k < Nmax
    x1 = x;
    f = feval(fun, x);
    if abs(f(2)) < ep
        break;
    end
    x = x - f(1)/f(2);
    if abs(x-x1) < ep
        index = 1;
        break;
    end
    k = k + 1;
end

x_star = x;

if k == Nmax
    warning('已迭代上限次数');
end

end

