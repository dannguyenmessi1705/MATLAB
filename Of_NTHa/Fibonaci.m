function [ xN ] = Fibonaci( N )
clc;
x=[];
x(1)=1;
x(2)=1;
for i=3:N
    x(i)=x(i-1)+x(i-2);
end
disp('Ket qua bai toan la:')
 x= x(N)
end

