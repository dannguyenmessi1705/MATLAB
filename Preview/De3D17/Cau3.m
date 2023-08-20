%% Cau 3
%a
t0 = 0;
T = 0.2; %(T = w/2pi, if (sin|cos)^2 => T = w/pi);
Ns = 1e3; % 1 chu ki
ts = (T-t0)/(Ns-1);
t = 0:ts:5*T;
fc = 500;
x = sin(30*pi*t)-3*cos(10*pi*t);
xc = sin(2*pi*fc*t);
ydc = (1+x).*xc;
%b
yNoise = 0;
SNR_dB = 20;
SNR = 10^(20/10);
P0 = var(ydc)/SNR;
if isreal(ydc)
    yNoise = ydc + sqrt(P0)*randn(size(ydc));
else
    yNoise = ydc + sqrt(P0)*randn(size(ydc))+1i*randn(size(ydc));
end
%c
figure(1);
plot(t,x);
title('Tin hieu ban dau');
figure(2);
plot(t,ydc);
title('Tin hieu sau dieu che');
figure(3);
plot(t,yNoise);
title('Tin hieu sau nhieu');