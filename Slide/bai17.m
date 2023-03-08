clc;
A = (1:0.5:5);
B = flip(A);
[rows, colums] = size(A);
v = mod(A, 1) == 0; % Check so nguyen trong vecto A
z = A(v); % In ra cac so co gia tri logic la 1 trong v tuong ung voi vi tri trong MT A


    
