T=1;
Np = 4;
Nsp = 500;
Ns = Nsp*Np;
ts =T/Nsp;
t=-0:ts:Np*T+(Np-1)*ts;
y=[];
for i=1:Np
    for t1=0:ts:T
        if (t1>0) & (t1<=T/2)
            y1 = 1;
        else 
            y1 = 0;
        end
        y = [y y1];
    end
end
subplot(211);
plot(t,y, LineWidth=2);
[f, Pf] = Pho(y, ts);
subplot(212);
semilogy(f,Pf);

function [f, Pf] = Pho(y, ts)
    Ns = length(y);
    f = [-Ns/2:Ns/2-1]/(Ns*ts);
    Pf = fft(y);
    Pf = fftshift(Pf)/Ns;
    Pf = abs(Pf).^2;
end