f = @(x) x*exp(1-x);
a = 0;
b = 3;
N = 15;
h = (b-a)/N;
tp = 0;
for i=1:N
    t = a + (i -1/2)*h;
    tp = tp + f(t);
end
tp = tp*h;
disp(tp);
