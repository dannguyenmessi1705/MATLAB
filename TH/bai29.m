function exp = bai29(A, T)
N = A+2;
A = 1; % bien do cua xung
t = linspace(0, N*T, 1000*N);
f = zeros(size(t)); % khoi tao f y(t)
for k = 1:2:20 % tao 10 chu ki xung voi 20 nua chu ky.
    f = f + (2*A/pi)*(-1)^(k-1)/(k^2)*sin(2*pi*k/T*t); % tinh toan giá tri xung tam giac voi cong thuc ða cho
end

plot(t, f);
grid on;
title('10 xung hàm e^{x^2}');
xlabel('Th?i gian (s)');
ylabel('Biên ð?');
