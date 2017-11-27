function x = Gauss_x( A,b )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Guass选取主元消去法解线性方程组
% x = Gauss_x( A,b )
% A为系数矩阵，b为右端列向量（以行形式输入），x为解向量
A = [A';b]', n = length(b);
for k = 1:n-1
    s = A(k,k);
    p = k;
    for i = (k+1):n
        if abs(s)<abs(A(i,k))
            s = A(i,k);
            p = i;
        end
    end

% p表示主元的行数，s表示主元

    if p ~= k
        for j = k:(n+1)
            t = A(k,j);
            A(k,j) = A(p,j);
            A(p,j) = t;
        end
    end

    for i = (k+1):n
        m = A(i,k)/A(k,k);
        fprintf('m%d%d = %f\n', i, k, m);
        for j = k:(n+1)
            A(i,j) = A(i,j) - m*A(k,j);
        end
    end
    fprintf('A%d = \n', k+1);
    
end
    
A(n,n+1) = A(n,n+1)/A(n,n);
for i = (n-1):-1:1
    s = 0;
    for j = (i+1):n
        s = s+A(i,j)*A(j,n+1);
    end
    A(i,n+1) = (A(i,n+1)-s)/A(i,i);
end

A( :,n+1)

end

