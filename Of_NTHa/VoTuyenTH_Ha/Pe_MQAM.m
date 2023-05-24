function Pe_MQAM(M)
EbNo_dB= -10:10;
EbNo= 10.^(EbNo_dB/10);
x=sqrt(3*log2(M)*EbNo/(M-1));
Pe=(4/log2(M))*(1-1/sqrt(M))*qfunc (x);
semilogy(EbNo_dB, Pe);
hold on;
grid on;
EbNo_s=[-10 -8 -6 -4 -2 0 2 4 6 8 10];
Pe_s=[0.4795 0.3519 0.2208 0.1088 0.03656 0.006856 0.000567 8e-6 2e-7 0 0 ];
semilogy(EbNo_s, Pe_s, 'r--o','linewidth',2);