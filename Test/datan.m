fs = 1000; % Tan so lay mau
t = 0:1/fs:1; % Truc thoi gian
f = [10 50 100];  % Tan so cac song da tan
A = [1 2 4]; % Bien do cac song da tan
phi = [0 pi/4 pi/2]; % Pha ban dau cua cac song da tan

x = zeros(size(t)); % Khoi tao tin hieu ban dau bang 0
for n = 1:length(f)
    x = x + A(n)*cos(2*pi*f(n)*t + phi(n)); % Cong don cac tin hieu da tan lai
end
plot(t,x)
xlabel('Thoi gian (s)')
ylabel('Bien do')
title('Tin hieu da tan')
