% Thi?t l?p các thông s?
T = 1;      % Chu k? T
gamma = T/2;    % Giá tr? gamma
N = 10;     % S? chu k? ð? v? ð? th?
t = 0:T/100:(N*T-T/100);    % M?ng th?i gian

% T?o tín hi?u nh? phân bãng g?c ng?u nhiên
x = zeros(size(t));    % Kh?i t?o m?ng tín hi?u
Ak = [1 0 1 0 0 1 1 0 0 1];   % Chu?i bit truy?n thông
for k = -N:N
    x = x + Ak(mod(k,length(Ak))+1)*p(T/2,t-gamma-k*T);
end

% V? ð? th? tín hi?u
plot(t,x);
xlabel('Th?i gian');
ylabel('Tín hi?u');
title('Tín hi?u nh? phân bãng g?c ng?u nhiên v?i gamma = T/2 và l?p l?i chu k? T/2 l?n');

% Hàm xung p(t) có chu k? T/2 và ð? r?ng xung b?ng 1
function y = p(T,t)
    y = rectpuls(t-T/4,T/2);
end
