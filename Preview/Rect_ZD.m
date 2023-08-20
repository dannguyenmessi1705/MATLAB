%% Chuong trinh tao chuoi xung vuong u(t) = 1 (t<=Tp) && u(t) = 0 (t>Tp)
Rp = 1e6; % Rp - Toc do xung (Dung de tim Tp - chu ky cua 1 xung)
Tp = 1/Rp; % Chu ky 1 xung (do rong xung)
Tw = Tp/2; % Tw - chu ky (do rong) cua xung 1 va xung 0
Nsp = 50; % So luong mau trong 1 xung
Np = 10; % Np - So xung can bieu dien
ts = Tp/Nsp; % Chia khoang thoi gian thanh Nsp doan trong 1 xung
Ns = Np * Nsp; % Ns - So luong lay mau trong Np xung
Timewindow = (Ns-1)*ts; % Thoi gian quan sat trong Ns mau
t = 0:ts:Timewindow; % Tao vecto thoi gian
y = zeros(size(t)); % y - xung vuong dau ra
for i=1:Ns
    if mod(t(i), Nsp*ts) <= Tw % Neu thoi diem t(i) trong tong thoi gian 1 xung <= chu ky cua xung 1 hoac 0
        y(i) = 1;
    else 
        y(i) = 0;
    end
end
plot(t,y);
title('Xung vuong');
ylim([-0.5 1.5]);