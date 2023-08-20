%% Chuong trinh Giai phuong trinh vi phan bang Euler va Euler bien doi
% Cho dy/dt = y-t, t = 0->2, h=0.25, y0=2/3
h = 0.08; % co buoc
f = @(t,y) 8*t^2-6*y; % PT VP
t0=0; % Thoi gian bat dau
tf=8; % Thoi gian ket thuc
N = (tf-t0)/h; % So buoc lap
y(1) = 1; % Gia tri dau cua PT VP
t(1) = t0; % Gia tri ban dau cua thoi gian
% Giai PTVP bang pp Euler
for i=1:N
    y(i+1) = y(i) + f(t(i),y(i))*h;
    t(i+1) = t(i) + h;
end
plot(t,y,'b');
hold on;
% Giai PTVP bang Euler bien doi (RK2)
y_bd(1) = 1;
t_bd(1) = t0;
for i=1:N
    y_tmp = y_bd(i) + f(t_bd(i),y_bd(i))*h; % tinh nghiem du doan
    t_bd(i+1) = t_bd(i) + h;
    y_bd(i+1) = y(i) + h * ( f(t_bd(i),y_bd(i)) + f(t_bd(i+1),y_tmp) )/2; 
end
plot(t_bd,y_bd,'r');
legend('PP Euler', 'Euler bien doi');
