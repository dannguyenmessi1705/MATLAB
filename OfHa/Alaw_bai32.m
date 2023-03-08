%Bai 32
%Ham nen theo luat A
function [y,amax]= Alaw_bai32(x,A) 
clc;
clear all;
% voi x la vector dau vao, A la he so nen
amax= max(abs(x));% Xac dinh bien do cuc dai cua tin hieu dau vao
xn= x/amax;
y= sign(x).* log(1+A*abs(xn))/log(1+A);
y=y*amax;