a = 6;
b = 8;
N = 48; % Gia tri N
f = N * 100; % Tan so tin hieu
T = 1/f;
fc = 1000 * f; % Tan so song mang
Ns = 2^9; % number of samples
t0 = 0;
tf = 5*T;
ts = (tf-t0)/(Ns-1); 
fs = 1/ts; % sampling frequency [Hz]
t = t0:ts:tf; % time vector
s = a * cos(2*pi*f*t + b); % Tin hieu goc
c = b * sin(2*pi*fc*t + b); % Song mang
% Dieu che PM
m = 0.5;
pdev = pi*m; % He so do bien thien tan so
ydc =  b * cos(2*pi*fc*t + pdev*c);
subplot(3, 1, 1);
plot(t, s);
title('Tin hieu goc');
xlabel('Thoi gian');
ylabel('Bien do');

subplot(3, 1, 2);
plot(t, c);
title('Song mang');
xlabel('Thoi gian');
ylabel('Bien do');

subplot(3, 1, 3);
plot(t, ydc);
title('Tin hieu dieu che PM');
xlabel('Thoi gian');
ylabel('Bien do');
