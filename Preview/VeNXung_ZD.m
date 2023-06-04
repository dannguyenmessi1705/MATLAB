R = 1e3;
Tp = 1/R;
fs = 16*R;
Np = 5;
f = @(t) exp(-4*t/Tp);
y = [];
t = [];
t = 0:1/fs:Tp*5+(Np-1)*1/fs;
for i=1:Np
    t1 = 0:1/fs:Tp;
    y1 = f(t1);
    y = [y,y1];
end
subplot(211)
plot(t,y);
[f, Pf] = pho(y, t);
subplot(212)
plot(f,Pf);

function [f, Pf] = pho(yr, tr)
Ns = length(yr);
ts = tr(2)-tr(1);
f = [-Ns/2:Ns/2-1]/(Ns*ts);
Pf = fft(yr, Ns);
Pf = fftshift(Pf)/Ns;
Pf = abs(Pf).^2;
end
