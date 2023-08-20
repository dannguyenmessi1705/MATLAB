%% Chuong trinh ve pho tin hieu, uoc tinh pho cong suat PSD
t = 0:255;
x = zeros(1, length(t));
x(1:20) = 1;
subplot(211);
plot(t,x);
grid on;
title('Tin hieu ban dau');
subplot(212);
[f, Pf] = spectrocal(t, x);
semilogy(f,Pf);
title('Pho tin hieu mien tan so');


function [f, Pf] = spectrocal(t,x)
% t - vecto thoi gian, x - vecto dau vao
% f - vecto tan so, Xf - Uoc tinh pho cong suat PSD cua x
Ns = length(t); % So luong mau
Ts = t(2)-t(1); % Thoi gian lay mau
f = (-Ns/2:Ns/2-1)/(Ns*Ts); % Tao vecto tan so
Pf = fft(x,Ns); % Chuyen x ve mien tan so
Pf = fftshift(Pf)/Ns; %  Dich thanh phan tan so 0 ve trung tam pho
Pf = abs(Pf).^2; % Tinh mat do pho cong suat
end