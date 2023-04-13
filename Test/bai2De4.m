f = @(t,y) ap*y.^bt+y;
y(1) = 1;
h = 0.25;
ap = 3;
bt = 1.5;
a = 0;
b = 2;
t = a:h:b;
for i=2:length(t)
    y(i) = y(i-1)+f(t(i-1), y(i-1))*h;
end
disp(y)
plot(t,y);