function Pe_QPSK()

EbNo_dB = -10:10;
EbNo = 10.^(EbNo_dB/10);
Pe_QPSK = 2* qfunc(sqrt(2*EbNo));


EbNo_simul = [-10 -5 0 5  10];
Pe_QPSK_simul = [0.5497 0.3853 0.1509 0.013 0.000005 ];

semilogy(EbNo_dB,Pe_QPSK, EbNo_simul, Pe_QPSK_simul,'r--o','linewidth',2);
grid on;
legend ('Ly thuyet', 'Mo phong')


end


