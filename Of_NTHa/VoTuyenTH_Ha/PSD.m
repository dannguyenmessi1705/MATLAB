function [] = PSD(A,T,fc)

f=-1e6:1e3:1e6;
PSD_Bang_Goc=[];
PSD_Bang_Thong=[];
for i=1:length(f)
    PSD_Bang_Goc(i)=A^2 * T *(sinc(f(i)*T))^2;
    PSD_Bang_Thong(i)=((A^2*T)/4)*( sinc((f(i)-fc)*T)^2 + sinc((f(i)+fc)*T)^2);
    
end
plot (f, PSD_Bang_Goc, 'linewidth',2);
hold on;
grid on;
plot(f, PSD_Bang_Thong, 'r', 'linewidth',2);
legend('PSD Bang goc', 'PSD Bang Thong');
title ('PSD cua tin hieu bang goc va bang thong');
xlabel('Tan so [Hz]');
ylabel ('Mat do pho cong suat PSD');

