%% Chuong trinh Tinh Tich phan bang phuong phap midpoint
% Cho TP y, can duoi a, can tren b, so lan chia N, khoang chia h
% VD: f = (4*x^3)*(2*exp(x))*cos(x), a = -1.5, b = 1.5, N = 100, h = (a-b)/N
% Run: tp = Midpoint_ZD(@(x) (4*x^3)*(2*exp(x))*cos(x), -1.5, 1.5, 100)
function tp = Midpoint_ZD(f, a, b, N)
h = (b-a)/N; % Khoang chia tu a toi b voi N doan
tp = 0; % bien luu ket qua tich phan
for i=1:N
    mid = a + (i-0.5)*h; % Xac dinh cac diem nam o giua cac khoang da chia
    tp = tp + f(mid); % Tinh toan tich phan
end
tp = tp * h; % Ket qua cuoi cung
