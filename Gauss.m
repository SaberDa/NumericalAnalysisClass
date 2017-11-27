function [ A,x ] = Gauss( A, b )
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
% ˳��Gauss��ȥ�������н����������Է�����Ax = b
% Gauss( A, b )��AΪ����ϵ����bΪ�Ҷ���������xΪ������
 n = length(b);
 A = [A, b];
% ��Ԫ
for k = 1: (n-1)
    A((k+1):n, (k+1):(n+1)) = A((k+1):n, (k+1):(n+1)) - A((k+1):n, k)/A(k,k)*A(k,(k+1):(n+1));
    A((k+1):n, k) = zeros(n-k, 1);
    A;
end

% �ش�
x = zeros(n,1);
x(n) = A(n,n+1)/A(n,n);
for k = (n-1) : -1 : 1
    x(k,:) = (A(k,n+1) - A(k, (k+1):n))*x((k+1):n)/A(k,k);
end

end

