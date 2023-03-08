a = 6; b = 8; c = 12;
A = [a-c -b; c-a 2*b; a-3*c c];
B = [10; 5; 2];
x = linsolve(A, B);
disp(x);
