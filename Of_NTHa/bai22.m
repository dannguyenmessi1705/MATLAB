%Bai 22
clc;
clear ;
fx= @(x) 4*x^3* 2*exp(x)*cos(x);
a=input('a=');
b=input('b=');
N=input('N=');
h=(b-a)/N;
S=h/2 * (fx(a)+ fx(b));
    for k=1:N-1
        S=S+ h* sum(fx(a+ k *h));
    end
disp('Ket qua cua tich phan la:');
h= sprintf('%.10f', S)

