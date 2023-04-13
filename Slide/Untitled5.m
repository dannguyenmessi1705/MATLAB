% T?o chu?i bit ng?u nhi�n
nBits = 5000;
bits = randi([0 1], 1, nBits);

% Chuy?n �?i chu?i bit th�nh d?ng s�ng NRZ l�?ng c?c
fS = 100e6;
sig = nrz_encode(bits, fS);

% T?o b? l?c raised cosine
span = 10;
beta = 0.5;
rolloff = 0.5;
h = rcosdesign(beta, span, fS, 'sqrt');

% L?c chu?i t�n hi?u NRZ b?ng b? l?c raised cosine
sig_filtered = filter(h, 1, sig);

% V? bi?u �? s�ng c?a chu?i t�n hi?u tr�?c v� sau khi l?c
t = (0:length(sig)-1)/fS;
t_filtered = (0:length(sig_filtered)-1)/fS;
figure;
subplot(2,1,1);
plot(t, sig);
title('Chu?i t�n hi?u NRZ tr�?c khi l?c');
xlabel('Th?i gian (s)');
ylabel('�i?n �p (V)');
subplot(2,1,2);
plot(t_filtered, sig_filtered);
title('Chu?i t�n hi?u sau khi l?c b?ng b? l?c raised cosine');
xlabel('Th?i gian (s)');
ylabel('�i?n �p (V)');

% V? bi?u �? m?t c?a chu?i t�n hi?u sau khi l?c
nPeriods = 2;
nSamplesPerPeriod = round(1/(fS/nBits)*nPeriods);
eyediagram(sig_filtered, nSamplesPerPeriod);
title('Bi?u �? m?t c?a chu?i t�n hi?u sau khi l?c b?ng b? l?c raised cosine');
xlabel('Th?i gian (s)');
ylabel('�i?n �p (V)');
