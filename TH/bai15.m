a = 6;
b = 8;
x = -10:0.01:10;
f = @(x0, a0, b0) a0*rectpuls(x0, b0);

plot(x, f(x, a, b), 'r-');
title('Xung hinh chu nhat T = 8');
axis([-10 10 -1 8]);
xlabel('t');
ylabel('Bien do');
