N = 48; % Gia tri N
f = N * 100; % f tin hieu
fc = 1000 * f; % f song mang
b = 6; % Pha ban dau
kf = 0.1; % He so bien thien tan so

Ns = 2^9; % number of samples
T0 = 0; % start time [s]
Tf = 5e-3; % end time [s]
Ts = (Tf-T0)/(Ns-1); % sampling period
fs = 1/Ts; % sampling frequency [Hz]
t = T0:Ts:Tf; % time vector

s = 8 * cos(2*pi*f*t + b); % Tin hieu goc
c = 6 * sin(2*pi*fc*t + b); % Song mang
plot(t,c);
% Ðieu che FM
fm = kf * f; % Tan so bien thien FM

FM = b*sin(2*pi*fc*t + ((fc-f)/fm).*s + b);

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
plot(t, FM);
title('Tin hieu dieu che FM');
xlabel('Thoi gian');
ylabel('Bien do');
