%% Chuong trinh tao chuoi xung tam giac
Tp = 10; % Chu ki, do rong cua xung
Tw = Tp/2; % Nua chu ki xung
Np = 5; % So luong xung can ve
Nsp = 100; % So luong mau tren 1 xung
Ns = Nsp * Np; % So luong mau tren Ns xung
ts = Tp/Nsp; % Thoi gian lay mau tren xung
Timewindow = (Ns-1)*ts; % Thoi gian quan sat chuoi xung
t = 0:ts:Timewindow; % Tao vecto thoi gian
y = []; % Tao vecto bieu dien xung tam giac
for i=1:Ns
    y1 = 1 - abs((mod(t(i), Tp)-Tw)/Tw);
    y = [y y1];
end
subplot(211);
plot(t,y)
title(sprintf('Chuoi tam giac co %d xung voi chu ky %ds', Np, Tp));
