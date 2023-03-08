a = 6;
b = 8;
c = 12;
x = -10:0.01:10;
f = @(x0, a0, b0) a0*tripuls(x0, b0);

plot(x, f(x, a, b), 'r-');
title('Xung hinh tam giac T = 8');
axis([-10 10 -1 8]);
xlabel('t');
ylabel('Bien do');
