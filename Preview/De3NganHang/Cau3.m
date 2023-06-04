Nsp = 50;
Np = 4;
T=5;
ts = T/Nsp;
t=0:ts:Np*T + (Np-1)*ts;
Ns = Np*Nsp;
y = [];
for i=1:Np
    for t1=0:ts:T
        if t1>0 && t1<2
            y1 = exp(-t1);
        else
            y1 = 0;
        end
        y = [y y1];
    end
end
subplot(211);
plot(t,y, LineWidth=2);
[f, Yf, Pf] = Pho(y, ts);
subplot(212);
plot(f,real(Yf));

function [f, Yf, Pf] = Pho(y, ts)
    Ns = length(y);
    f = [-Ns/2:Ns/2-1]/(Ns*ts);
    Yf = fft(y,Ns);
    Yf = fftshift(Yf)/Ns;
    Pf = abs(Yf).^2;
end