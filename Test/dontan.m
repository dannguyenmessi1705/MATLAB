% Tao tin hieu don tan
% Bien do: 2, tan so: 100Hz, pha ban dau 45 do, t(0->1s)
A = 2;
f0 = 100;
phi = deg2rad(45); 
t = 0:0.01:1;   
x = A * cos(2*pi*f0*t + phi);
plot(t,x);
title('Tin hieu don tan');
xlabel('Thoi gian (s)');
ylabel('Bien do');
