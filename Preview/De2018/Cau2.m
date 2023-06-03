%% Cau 2
% a = 8, b = 6, s(t) = 3sin(100a*pi*t+pi/2)^2, ve 3*b chu ky, w=100api
a = 8;
b = 6;
T = pi/(100*a*pi);
Ns = 1e3;
t0=0;
tf=3*b*T;
ts=(tf-t0)/(Ns-1);
t = 0:ts:tf;
st = 3*sin(100*a*pi*t + pi/2).^2;
plot(t,st);
hold on;
grid;
title('Do thi tin hieu s(t)');
Thafl = T/2;
N = 1:2:3*b*2;
thafl = N*Thafl;
yhafl = 3*sin(100*a*pi*thafl + pi/2).^2;
plot(thafl, yhafl, 'ro');
legend('Tin hieu', 'Nua chu ky');

