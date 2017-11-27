function [ x_star, k ] = Gline( f, x0, x1, e, Nmax )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% ��˫����߷�������Է���f(x) = 0
% Gline( fun, x0, x1, ep, Nmax ) fun��ʾf(x)��x0��x1Ϊ������ֵ
% epΪ���ȣ�Ĭ��ֵΪ1e-5����x���ؽ�
% kΪ�������޴����Է���ɢ

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
    warning('�ѵ������޴���');
end

end

