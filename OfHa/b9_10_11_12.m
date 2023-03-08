%bai 9
clc;
clear all;
t=0:0.1:10
s_bai9= sin (2*pi*5*t) .* cos(2*pi*3*t) + exp(-0.1 *t)
%bai 10
s_bai10 = sin (2*pi*5.3*t) .* sin(2*pi*5.3*t)
%bai 11
s= 20 .* sin(2*pi*5*t)
ans= floor(s)
%bai 12
b=[1024 1000 100 2 1]
loga2= log2(b)
loga10 =  log10(b)
