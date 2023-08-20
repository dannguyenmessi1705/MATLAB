
function [t,y] = bai14(f1, f2, fs)
T1 = 1/f1;
T2 = 1/f2;
t = 0:1/fs:T2;
y = cos(2*pi*f1*t)+cos(2*pi*f2*t +pi/4);
SNR = 8;
noise = awgn(y, SNR);
scatterplot(noise);