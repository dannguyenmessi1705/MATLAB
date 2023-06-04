N=50;
a=-2;
b=0;
h = (b-a)/N;
f = @(x) x*exp(-x);
dx=0;
for i=1:N
    x = a + (i-1/2)*h;
    dx = dx + f(x);
end
dx = dx*h;
