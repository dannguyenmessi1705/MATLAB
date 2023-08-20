clear all;
clc;
N = 200;
M = 16;
snr = 10;
x = randi([0 M-1], 1, N);
dieuche = qammod(x, M);

Ps = var(dieuche);
Pn = Ps/(10^(snr/10));
noise = dieuche + sqrt(Pn/2)*(randn(1,N) + 1i*randn(1,N));
p = scatterplot(dieuche, 1, 0, "bp");
hold on;
scatterplot(noise, 1, 0, "rp", p);
eyediagram(noise, 2);