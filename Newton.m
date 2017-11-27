function [ x_star,k ] = Newton( fname, fdname, x0, ep, Nmax )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
% ��ţ�ٷ�������Է���f(x) = 0
% Newton( fname, fdname, x0, ep, Nmax)fname��fdname�ֱ�Ϊf(x)���䵼��
% x0Ϊ������ֵ��epΪ���ȣ�Ĭ��ֵΪ1e-5��
% x���ؽ⣬NmaxΪ�������޴����Է���ɢ��Ĭ��ֵΪ500��
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
    warning('�ѵ������޴���');
end

end

