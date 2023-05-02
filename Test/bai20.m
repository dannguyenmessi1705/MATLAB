N = 1000;
M = 4;
SNR = 10;
A = randi([0 M-1], 1, N);
dc = pskmod(A, M);
scatterplot(dc, 1, 0, "bp");
ps = var(dc);
pn = ps/(10^(SNR/10));
noise = dc + sqrt(pn/2)*(randn(1, N)+1i*randn(1,N));
scatterplot(noise,1,0,"rp");