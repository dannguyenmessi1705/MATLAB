a = 6;
b = 8;
A = randi([0 10], 9, 9);
B = randi([0 10], 1, 9);
A = cat(1, A, B);
A(a,:) = [];
A(:,b) = [];
A(a,b) = 0;
