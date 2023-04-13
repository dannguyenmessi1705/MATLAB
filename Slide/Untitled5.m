% T?o chu?i bit ng?u nhiên
nBits = 5000;
bits = randi([0 1], 1, nBits);

% Chuy?n ð?i chu?i bit thành d?ng sóng NRZ lý?ng c?c
fS = 100e6;
sig = nrz_encode(bits, fS);

% T?o b? l?c raised cosine
span = 10;
beta = 0.5;
rolloff = 0.5;
h = rcosdesign(beta, span, fS, 'sqrt');

% L?c chu?i tín hi?u NRZ b?ng b? l?c raised cosine
sig_filtered = filter(h, 1, sig);

% V? bi?u ð? sóng c?a chu?i tín hi?u trý?c và sau khi l?c
t = (0:length(sig)-1)/fS;
t_filtered = (0:length(sig_filtered)-1)/fS;
figure;
subplot(2,1,1);
plot(t, sig);
title('Chu?i tín hi?u NRZ trý?c khi l?c');
xlabel('Th?i gian (s)');
ylabel('Ði?n áp (V)');
subplot(2,1,2);
plot(t_filtered, sig_filtered);
title('Chu?i tín hi?u sau khi l?c b?ng b? l?c raised cosine');
xlabel('Th?i gian (s)');
ylabel('Ði?n áp (V)');

% V? bi?u ð? m?t c?a chu?i tín hi?u sau khi l?c
nPeriods = 2;
nSamplesPerPeriod = round(1/(fS/nBits)*nPeriods);
eyediagram(sig_filtered, nSamplesPerPeriod);
title('Bi?u ð? m?t c?a chu?i tín hi?u sau khi l?c b?ng b? l?c raised cosine');
xlabel('Th?i gian (s)');
ylabel('Ði?n áp (V)');
