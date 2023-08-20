function sum = bai21(N)
a = 6;
b = 8;
sum = 0;
f = @(n) (-2^a)/exp(-n);
for i=1:N
    sum = sum + f(i);
end
sum = sprintf('%.8f', sum);