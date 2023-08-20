f = @(x) x^3 + exp(x);
a = 1;
b = 4;
N = 50;
h = (b-a)/N;
tp = 0;
for i=1:N
    t = a + (i -1/2)*h;
    tp = tp + f(t);
end
tp = tp*h;
disp(tp);
