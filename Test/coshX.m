function [y_app, y_cal, y_loop] = coshX(x)
epsilon = 1e-4;
n = 0;
y_app = 0;
tmp = inf;
y_loop = [];
while abs(tmp) >= epsilon
    tmp = (x^(2*n))/factorial(2*n);
    y_app = y_app + tmp;
    y_loop(n+1) = y_app;
    n = n+1;
end
disp('Gia tri xap xi');
disp(y_app);
y_cal = sinh(x);
disp('Gia tri thuc te');
disp(y_cal);
disp('5 gia tri dau');
disp(y_loop(1:5));