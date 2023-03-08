%Bai 31
clc;
clear all;
% Tao chuoi bit ngau nhien phan bo deu co do dai 128 bit
v= randi([0 1],1,128)
%Chuyen doi chuoi bit thanh cac gia tri thap phan [0,15];
x=reshape(v,32,4);%Ham chuyen doi kich co
y=bi2de(x);
z=y'