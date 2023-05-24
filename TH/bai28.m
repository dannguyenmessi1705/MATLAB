function y = bai28(b, T)
N = b+2; % So xung
%T chu ki xung
%fs tan so xung
fs = 1/T * 100;
Tw=T/2;
tN=N*T;
Ts=1/fs;
y=[];
for t=0:Ts:tN
    y1=1-abs((mod(t,T)-Tw)/Tw);
    y=[y y1];
end
t=0:Ts:tN;
plot(t, y,'LineWidth', 2);
grid on;
title(sprintf('Chuoi tam giac co %d xung voi chu ky %.2fs', N, T));
xlabel('time');
ylabel('Amplitude');