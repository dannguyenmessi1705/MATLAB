function mul = bai22(N)
a = 6;
b = 8;
f = @(n) sqrt((a*n+1)/2) + n^2;
mul = 1;
for i=1:N
    mul = mul * f(i);
end
mul = sprintf('%.8f', mul);
