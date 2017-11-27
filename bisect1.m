function [ x_star,k ] = bisect1( fun, a, b, ep )
%BISECT1 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 4 ep = 1e-5; end

fa = feval(fun, a);
fb = feval(fun, b);

if fa*fb > 0
    x_star = [fa, fb];
    k = 0;
    return;
end

k = 1;

while abs(b-a)/2 > ep
    x = (a+b)/2;
    fx = feval(fun, x);
    if fa*fx < 0
        b = x;
        fb = fx;
    else 
        a = x;
        fa = fx;
    end
    k = k + 1;
end

x_star = (a+b)/2;

end

