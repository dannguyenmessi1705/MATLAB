%% AWGN
fc = 200;
fs = 32*fc;
ts=1/fs;
t = 0:ts:1/5*10;
x = cos(30*pi*t) - 3*sin(10*pi*t);
subplot(311);
plot(t,x);
%%
carrier = sin(2*pi*fc*t);
xdc = (1+x).*carrier;
% xdc = ammod(x,fc,fs);
subplot(312);
plot(t, xdc);
%%
noise = xdc+awgn(xdc,5,'measured');
subplot(313);
plot(t,noise);