EbN0_dB=0:30;
EbN0_lin=10.^(EbN0_dB/10);
Pe = qfunc(sqrt(2*EbN0_lin));
semilogy(EbN0_dB, Pe,'linewidth',2);

hold on;
grid on;
% EbN0_s= [-10 -5 0 5 10];
% Pe_s=[0.3276 0.2135 0.07892 0.005987 2e-6];
% semilogy(EbN0_s,Pe_s,'r--o', 'linewidth',2);
% legend('Ly thuyet', 'Mo phong');
% title('Khao sat BER theo li thuyet va mo phong cua BPSK');
% xlabel('Eb/N0 [dB]');
% ylabel ('log of BER');