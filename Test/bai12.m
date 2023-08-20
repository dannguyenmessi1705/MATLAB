function [t,y] = bai12(R, Np)
fs = 16*R %Tan so lay mau
Tp = 1/R;
f = @(t) exp(-4*t/Tp);
t = [];
y = [];
for i=0:Np-1
    t1 = i*Tp:1/fs:(i+1)*Tp;
    y1 = f(t1-i*Tp);
    t = [t,t1];
    y = [y, y1];
end
f = 0:1/(max(t)-min(t)):fs;
yf1 = fft(y, length(y));
yf2 = fftshift(yf1);
plot(t, y);
figure;
plot(f, yf2(1:length(f)));