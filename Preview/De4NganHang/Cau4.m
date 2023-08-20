Nb = 1000;
M = 16;
x = randi([0 M-1], 1, Nb);
xMod = qammod(x, M);
N0=10;
Es = 4;
phi=0;
Rsym = 1e6;
Rb = Rsym*log2(M);
fs = 32*Rsym;
ts=1/fs;
Tsym = 1/Rsym;
Ns = (Tsym/ts)*Nb;
fc=4*Rb;
tc = 0:ts:Tsym;
rc = zeros(size(tc));
rc(abs(tc)>=0.5*Tsym & abs(tc)<=1.5*Tsym)=1;
rc(abs(tc)<0.5*Tsym | abs(tc)>1.5*Tsym)=0;
t = [];
y = [];
pt = sqrt(2*Es/Tsym).*rc;
for i=1:Nb
    y1 = xMod(i)*pt*exp(1i*phi);
    y = [y y1];
    t = [t tc+(i-1)*Tsym];
end
yf = rsflt(y, ts, Rb, 1);
yf = yf.*exp(1i*2*pi*fc*t);
figure(1);
plot(t,yf);
title('Tin hieu truoc khi di qua kenh');
yn = addNoise(yf, N0, Es, Ns);
yafter = yn.*exp(-1i*2*pi*fc*t).*exp(-1i*phi);
xModN = addNoise(xMod, N0, Es, Ns);
figure(2);
plot(t,yafter);
title('Tin hieu qua kenh nhieu');
scatterplot(xMod, 1, 0);
scatterplot(xModN, 1, 0);
eyediagram(real(xMod),20);
eyediagram(real(xModN),20);

function yn = addNoise(y, N0, Es, Ns)
    N0 = 10^(N0/10);
    SNRdB = Es/N0 - 10*log10(Ns);
    SNR = 10^(SNRdB/10);
    P0 = var(y)/SNR;
    if isreal(y)
        yn = y + sqrt(P0)*randn(size(y));
    else
        yn = y + sqrt(P0/2)*(randn(size(y)) + 1i*randn(size(y)));
    end
end
function yf = rsflt(y, ts, B, beta)
    Ns = length(y);
    f = [0:Ns/2-1 -Ns/2:-1]/(Ns*ts);
    Tb = 1/B;
    beta = beta*B;
    Xf = fft(y);
    Yf = zeros(size(Xf));
    ind = abs(f)<=B/2-beta;
    Yf(ind) = Xf(ind).*Tb;
    ind = abs(f)>B/2-beta & abs(f)<=B/2+beta;
    Yf(ind) = Xf(ind).*(Tb*cos((pi/(4*beta)*(abs(f(ind))-B/2+beta))).^2);
    ind = abs(f)>B/2+beta;
    Yf(ind) = Xf(ind).*0;
    yf = ifft(Yf)./Tb;
end