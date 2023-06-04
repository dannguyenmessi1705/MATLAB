%% dieu che
x = randi([0 1], 1, 1500);
M = 16;
N0 = 10;
phi0 = 0;
Es = 5e-5;
Rs = 1e6;
Rb = Rs*log2(M);
fs = 32*Rs;
Tsym = 1/Rs;
ts = 1/fs;
Nb = length(x);
Timewindow = Tsym*Nb;
t = 0:ts:Timewindow;
k = 1;
dc = pskmod(x,M);
s = zeros(size(t));
for i=1:length(t)
    s(i) = (dc(k)*sqrt(2*Es/Tsym))*exp(1i*phi0);
    if t(i) >= k*Tsym
        k = k+1;
    end
end
s = s.*exp(1i*2*pi*Rb*t);
figure(1);
subplot(211);
plot(t,real(s));
%% noise
if isreal(s)
    sNoise = s + sqrt(N0)*randn(size(s));
else
    sNoise = s + sqrt(N0/2)*(randn(size(s)) + 1i*randn(size(s)));
end

sg = sNoise.*exp(-1i*2*pi*Rb*t).*exp(-1i*phi0);
dgdc = pskdemod(sg, M);
subplot(212)
plot(t,dgdc);
scatterplot(s);
figure(2);
scatterplot(dgdc);
figure(3)
eyediagram(s,20);
figure(4);
eyediagram(dgdc,20);
