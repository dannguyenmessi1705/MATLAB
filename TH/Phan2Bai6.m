% Chuong trinh vi du ve dieu che AM
%% Set parameters
a = 8;
b = 6;
N = 48;
% Message
A = a;
f = N*100; % frequency [Hz]
% phi = -pi/4; % Phase [rad]
% Carrier
m = 0.5; % modulation index
Ac = A/m; % amplitude
fc = 1000*f; % frequency [Hz]
% phi_c = 0; % Phase [rad]
Ns = 2^9; % number of samples
T0 = 0; % start time [s]
Tf = 5e-3; % end time [s]
Ts = (Tf-T0)/(Ns-1); % sampling period
fs = 1/Ts; % sampling frequency [Hz]
%% Amplitude Modulation
% Generate sinusoid
t = T0:Ts:Tf; % time vector
x = a*cos(2*pi*f*t+b); % message signal
xc = b*sin(2*pi*fc*t+b); % carrier signal
% Modulation
y = (1+x/Ac).*xc;


subplot(3, 1, 1);
plot(t, x);
title('Tin hieu goc');
xlabel('Thoi gian');
ylabel('Bien do');

subplot(3, 1, 2);
plot(t, xc);
title('Song mang');
xlabel('Thoi gian');
ylabel('Bien do');

subplot(3, 1, 3);
plot(t, y);
title('Tin hieu dieu che AM');
xlabel('Thoi gian');
ylabel('Bien do');
