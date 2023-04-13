a = 1;
r = 1;
h = 0.25;
y0 = 0;
f = @(t,y)r-a*y;
y_ex = @(t) (y0 - r/a)*exp(-a*t) + r/a;
k1 = 0;
k2 = 3;
t0 = k1;
n = (k2-k1)/h;
t(1) = t0;
y(1) = y0;
for i=1:n
    t(i+1) = t(i)+h;
    y(i+1) = y(i)+h*f(t(i),y(i));
end
plot(t,y,'ro-','linewidth', 2);
hold on
plot(t,y_ex(t),'b*-','linewidth',2);
legend('Nghiem theo Euler bien doi','Nghiem giai tich');
grid on