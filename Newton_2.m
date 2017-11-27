function [ x_star, index, k ] = Newton_2( fun, x, ep, Nmax )
%NEWTON_2 Summary of this function goes here
%   Detailed explanation goes here
% fun(x)Ϊ����������xΪ��ʼֵ��epΪ���ȣ�Ĭ��ֵΪ1e-5��
% �������ɹ�ʱx_starΪ���̵ĸ���������ʧ��ʱ������ĵ���ֵ
% index = 1��ʾ�����ɹ���index = 0��ʾ����ʧ��

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
    warning('�ѵ������޴���');
end

end

