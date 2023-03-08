function tri = bai28(b, T)
N = b+2; % So xung
f = 1/T; % Tan so
fs = 100*f; % Tan so lay mau
t = linspace(0, N*T, fs*N*T); % t chay tu 0 den N*T voi fs*N*T buoc nhay
x = (1/2)*sawtooth(2*pi*f*t)+0.5; % do ham sawtooth luon tra ve gia tri la [-1 1] ma xung tam giac chi co [0 1] nen ta chia cho 2 duoc [-0.5 0.5] roi cong them 0.5 de no ve [0 1]
plot(t, x,'LineWidth', 2);
grid on;
title(sprintf('Chuoi tam giac co %d xung voi chu ky %.2fs', N, T));
xlabel('time');
ylabel('Amplitude');
axis([0 N*T -0.2 1.2]);