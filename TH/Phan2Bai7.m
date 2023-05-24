
N = 48; % Gia tri N
f = N * 100; % Tan so tin hieu
fc = 1000 * f; % Tan so song mang
b = 6; % Pha ban dau
a= 8;

Ns = 2^7; % number of samples
T0 = 0; % start time [s]
Tf = 5e-3; % end time [s]
Ts = (Tf-T0)/(Ns-1); % sampling period
fs = 1/Ts; % sampling frequency [Hz]
t = T0:Ts:Tf; % time vector

s = a * cos(2*pi*f*t + b); % Tin hieu goc
c = b * sin(2*pi*fc*t + b); % Song mang
% Dieu che PM
kf = 2*pi*f; % He so do bien thien tan so
phi_pm = cumsum(kf * s); % Tich phan tin hieu de thu pha PM

PM = cos(2*pi*fc*t + phi_pm); % Tin hieu dieu che pha PM


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
plot(t, PM);
title('Tin hieu dieu che PM');
xlabel('Thoi gian');
ylabel('Bien do');
