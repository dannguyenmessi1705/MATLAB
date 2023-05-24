function [] = Pe_MPSK(M)
EbNo_dB=-10:10;
EbNo=10.^(EbNo_dB/10);
Pe= 2* qfunc(sqrt(4*log2(M)*EbNo)*sin(pi/(2*M)));
semilogy(EbNo_dB, Pe);

grid on;
hold on;
EbNo_s=[-10 -8 -6 -4 -2 0 2 4 6 8 10];
Pe_s=[0.7264 0.6805 0.6217 0.5459 0.4536 0.3479 0.2378 0.1377 0.06147 0.01838 0.003001];
semilogy(EbNo_s, Pe_s, 'r--o', 'linewidth',2);
end

