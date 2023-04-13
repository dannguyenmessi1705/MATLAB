clear all;
clc;
x = 0.8;
f = @(n) (((-1)^n)/(2*n+1))*x^(2*n+1);
epsilon = 1e-4;
check = inf;
n = 0;
result = 0;
while check > epsilon
    result = result + f(n);
    check = abs(result - atan(x));
    n = n+1;
end
disp("So vong lap: ");
disp(n);
disp("Gia tri gan dung la: ");
disp(result);
result = 0;
for i=1:5
    result = result + f(i);
end
disp(result);