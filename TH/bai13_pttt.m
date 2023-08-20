a = 6; b = 8; c = 12;
A = [a -b -c; c 2*b -a; a c -3*c];
B = [10; 5; 2];
x = linsolve(A, B);
disp(x);
