bits = randi([0 1],1,2000);
Rb = 50e6;
Ns = 2e3;
[t,y,ts] = nrz(bits, Rb, Ns);
subplot(211)
plot(t,y);
yf = butterworth(y,5,150e6,ts);
subplot(212)
plot(t,yf);

function [t, y, ts] = nrz(bits, Rb, Ns)
Tb = 1/Rb;
Nb = 5;
Timewindow = Nb*Tb;
ts = Timewindow/(Ns-1);
t=0:ts:Timewindow;
y = zeros(size(t));
for i=1:Ns
    n = fix(t(i)/Tb) + 1;
    if(n>=Nb) 
        n=Nb;
    end
    y(i) = 2*bits(n)-1;
end
end

function yf = butterworth(y,n,B,Ts)
Ns = length(y);
f = [0:Ns/2-1 -Ns/2:-1]/(Ns*Ts);
Xf = fft(y);
Hf = 1./(1+(f/B).^(2*n));
Yf = Xf.*Hf;
yf = ifft(Yf);
end
