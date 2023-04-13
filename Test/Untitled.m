% Thi?t l?p c�c th�ng s?
T = 1;      % Chu k? T
gamma = T/2;    % Gi� tr? gamma
N = 10;     % S? chu k? �? v? �? th?
t = 0:T/100:(N*T-T/100);    % M?ng th?i gian

% T?o t�n hi?u nh? ph�n b�ng g?c ng?u nhi�n
x = zeros(size(t));    % Kh?i t?o m?ng t�n hi?u
Ak = [1 0 1 0 0 1 1 0 0 1];   % Chu?i bit truy?n th�ng
for k = -N:N
    x = x + Ak(mod(k,length(Ak))+1)*p(T/2,t-gamma-k*T);
end

% V? �? th? t�n hi?u
plot(t,x);
xlabel('Th?i gian');
ylabel('T�n hi?u');
title('T�n hi?u nh? ph�n b�ng g?c ng?u nhi�n v?i gamma = T/2 v� l?p l?i chu k? T/2 l?n');

% H�m xung p(t) c� chu k? T/2 v� �? r?ng xung b?ng 1
function y = p(T,t)
    y = rectpuls(t-T/4,T/2);
end
