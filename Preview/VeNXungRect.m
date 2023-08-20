T = 5;
Np = 5;
Nsp = 500;
Ns = T*Nsp;
ts = T/Nsp;
t = -Np*T:ts:Np*T+(Np-1)*ts;
y = [];
for i=1:Np
    for t1 =-T:ts:T
        if abs(t1) <= T/2
            y1= 1;
        else
            y1= 0;
        end
        y = [y y1];
    end
end
subplot(211);
plot(t,y,LineWidth=2);

[f, Pf, Yf] = Pho(y, ts);
subplot(212);
semilogy(f,Pf);

function [f, Pf, Yf] = Pho(y, ts)
    Ns = length(y);
    f = [-Ns/2:Ns/2-1]/(Ns*ts);
    Yf = fft(y,Ns);
    Pf = fftshift(Yf)/Ns;
    Pf = abs(Pf).^2;
end
