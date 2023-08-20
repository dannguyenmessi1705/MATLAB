function [t,y] = bai11(R, Np)
fs = 16*R %Tan so lay mau
 
f = 0:1/(max(t)-min(t)):fs;
yf1 = fft(y, length(y));
yf2 = fftshift(yf1);
plot(t, y);
figure;
plot(f, yf2(1:length(f)));