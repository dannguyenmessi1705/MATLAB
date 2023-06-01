%% Tao chuoi xung vuong u(t) = 1 (t<=Tp) && u(t) = 0 (t>Tp)
% Run rect_ZD(Tw, Rp, Ns, Np)
function y = rect_ZD(Tw, Rp, Ns, Np)
% Tw - chu ky (do rong) cua xung 1 va xung 0
% Rp - Toc do xung (Dung de tim Tp - chu ky cua 1 xung)
% Ns - So luong lay mau
% Np - So xung can bieu dien
% y - xung vuong dau ra
Tp = 1/Rp; % Chu ky 1 xung 
Timewindow = Tp*Np; % Thoi gian quan sat Np xung
ts = Timewindow/(Ns-1); % Chia khoang thoi gian thanh Ns doan
t = 0:ts:Timewindow; % vector thoi gian
Ns_per_p = round(Tp/ts); % So luong mau tren 1 xung
y = zeros(size(t));
for i=1:Ns
    if mod(t(i), Ns_per_p * ts) <= Tw % Neu thoi diem t(i) trong tong thoi gian 1 xung <= chu ky cua xung 1 hoac 0
        y(i) = 1;
    else
        y(i) = 0;
    end
end
plot(t,y);
title('Xung vuong');
ylim([-0.5 1.5]);
