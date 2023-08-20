a = 6;
b = 8;
A = [1 2; 3 4];
B = a*ones(2, 2);
A = [A B B B B B; B B B B B B; B B B B B B; B B B B B B; B B B B B B; B B B B B B];
A(b+4, b+4) = 10;
