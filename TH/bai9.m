a = 6;
b = 8;
A = randi([0 10], 9, 9);
A(6, 8) = 4;
% M5 = 5*ones(9, 9);
% M10 = -10*ones(9, 9);
% CMP = A == M5;
% TMP = CMP.*M10;
% A = A+TMP;
A(A==5) = -5;