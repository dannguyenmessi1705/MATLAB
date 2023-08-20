function tp = bai23(N)
a = 6;
b = 8;
f = @(x) exp(x)*atan(x^2)/cos(x);
dx = (b-a)/(N*100);
tp = 0;
for i=1:N
    xmid = a + (i - 0.5) * dx;
    tp = tp + f(xmid);
end
tp = tp*dx;
disp('Gia tri tich phan: ');