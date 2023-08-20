%% Chuong trinh giải PTVT RK4
% tìm nghiệm ptr vi phân: y' = r - a*y với a = 1, r = 1
% y(0) = 0, cỡ bước h = 0.25. Tại t0 = 1, tf = 2
a = 1;
r = 1;
h = 0.25;
f = @(t,y) r-a*y;
t0 = 1;
tf = 2;
N = (tf-t0)/h;
y(1) = 0;
t(1) = t0;
for i=1:N
    t(i+1) = t(i) + h;
    k1 = h * f(t(i), y(i));
    k2 = h * f(t(i) + 1/2 * h, y(i) + 1/2 * k1);
    k3 = h * f(t(i) + 1/2 * h, y(i) + 1/2 * k2);
    k4 = h * f(t(i) + h, y(i) + k3);
    y(i+1) = y(i) + (1/6*(k1+k4) + 1/3*(k2+k3));
end
plot(t,y);
title('Nghiem RK 4');