%% Cau 1
%a
A = [1 -5 1i 0 2+3i; 
     3-1i 9 22 -31i -7; 
     87 -8i 5 9-35i 10; 
     0 3+19i 2-43i -73 -8; 
     7+13i -13 39 3+53i 99];
%b
Acv = A.';
%c
B = real(A);
%d
tmp = B';
C = tmp(:)';
%e
D = C(C>0);
%d
SUM = sum(D);