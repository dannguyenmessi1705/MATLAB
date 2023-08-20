%% Cau 2
%a
bits = randi([0 1], 1, 2000);
%b
Rb = 50e6;
[t, ts, y, Nsp] = nrz(bits, Rb);
%c
yb = butterworth(y, 5, 150e6, ts);
%d
subplot(211);
plot(t(1:Nsp*5),y(1:Nsp*5));
title('Tin hieu truoc khi vao bo loc');
subplot(212);
plot(t(1:Nsp*5),yb(1:Nsp*5));
title('Tin hieu sau khi vao bo loc');
function [t, ts, y, Nsp] = nrz(bits, Rb)
Tb = 1/Rb;
Nb = length(bits);
Nsp = 50;
ts = Tb/Nsp;
Ns = Nb * Nsp;
Timewindow = (Ns-1)*ts;
t = 0:ts:Timewindow;
y = [];
for i=1:Nb
    pol = 2*bits(i)-1;
    sig = pol*ones(1, Nsp);
    y = [y sig];
end
end

function yb = butterworth(y, n, B, ts)
Ns = length(y);
f = [0:(Ns/2)-1 -Ns/2:-1]/(Ns*ts); 
Xf = fft(y);
Hf = 1./(1+(f/B).^(2*n));
Yf = Xf.*Hf;
yb = ifft(Yf);
end
