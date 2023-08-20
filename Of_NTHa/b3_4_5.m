%bai 3:
clc;
clear all;
A=[ -1 3.5 2;  0 1 -1.3; 1.1 2 1.9]
B=[ 1 0 -1; -1.5 1.5 -3; 1 1 1]
V= A*B
%bai 4
%Ma tran dao nguoc cua A la Ainv = O/A voi O la ma tran don vi tuong ung
A=[-1 3.5 2; 0 1 -1.3; 1.1 2 1.9];
O=[1 0 0; 0 1 0; 0 0 1];
C= A.*O
%Bai 5
M=[ 1 1 1;1 0 1; -1 0 0]
M_inverse= O/M