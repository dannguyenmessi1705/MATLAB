M = 16;
Nb = 1000;
x = randi([0 M-1],1 , Nb);
xMod = qammod(x,M);
Rsym = 3e5;
Rb = Rsym*log2(M);
Es = 4;
Tsym = 1/Rsym;
phi = 0;
N0=9;
fs = 32*Rsym;
ts = 1/fs;
fc = 4*Rb;
Ns = (Tsym/ts)*Nb;
tc = 0:ts:Tsym;
y = [];
t = [];
xc = 1-cos((2*pi*tc)/Tsym);
pt = sqrt(2*Es/Tsym).*xc;
for i=1:Nb
    y1 = xMod(i)*pt*exp(1i*phi);
    y = [y y1];
    t = [t tc+(i-1)*Tsym];
end
yf = rscflt(y,Rb,ts,1);
yc = yf.*exp(1i*2*pi*fc*t);
figure(1);
plot(t,yc);
title('Truoc kenh');
figure(2);
yn = addNoise(yc, N0, Es, Ns);
yn = yn.*exp(-1i*2*pi*t*fc).*exp(-1i*phi);
xModn = addNoise(xMod,N0,Es,Ns);
plot(t,yn);
title('Sau kenh');
scatterplot(xMod, 1, 0);
scatterplot(xModn, 1, 0);
eyediagram(real(xMod), 20);
eyediagram(real(xModn),20);
function yn = addNoise(yc, N0, Es, Ns)
    N0 = 10^(N0/10);
    SNR_dB = Es/N0 -10*log10(Ns);
    SNR = 10^(SNR_dB/10);
    P0 = var(yc)/SNR;
    if isreal(yc)
        yn = yc+sqrt(P0)*randn(size(yc));
    else
        yn = yc+sqrt(P0/2)*(randn(size(yc)) +1i*randn(size(yc)));
    end
end
function yf = rscflt(y, B, ts, beta)
    Ns = length(y);
    beta = beta*B;
    Tb = 1/B;
    f = [0:Ns/2-1 -Ns/2:-1]/(Ns*ts);
    Xf = fft(y);
    Yf = zeros(size(Xf));
    ind = abs(f)<=B/2-beta;
    Yf(ind) = Xf(ind).*Tb;
    ind = abs(f)>B/2-beta & abs(f)<=B/2+beta;
    Yf(ind) = Xf(ind).*(Tb * cos(pi/(4*beta) * (abs(f(ind)) - B/2+beta)).^2);
    ind = abs(f) > B/2+beta;
    Yf(ind) = Xf(ind).*0;
    yf = ifft(Yf)./Tb;
end