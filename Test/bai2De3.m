fx = @(x) x*exp(-x);
a = -2;
b = 0;
N = 50;
h = (b-a)/N;
tp = 0;
for i=1:N
    t = a + (i-1/2)*h;
    tp = tp + fx(t);
end
tp = tp*h;
disp(tp);