%% Chuong trinh MATLAB ve xung RZ 30% (xung 0 giu nguyen, xung 1 thi 30% dau la xung 1, 70% sau ve xung 0) 
x = randi([0 1], 1, 20);
Rb = 1e6;
[t, y, code] = nrz(x, Rb, 0.5);
plot(t,y);
ylim([-1.5 1.5]);
function [t, y , code] = nrz(x, Rb, r)
% x - chuoi bit dau vao
% Rb - toc do bit
% r - ty le xung RZ
Tb = 1/Rb; % Chu ki xung cua 1 bit
Nb = length(x); % So luong bit can bieu dien
Nsp = 50; % So luong mau tren 1 bit
ts = Tb/Nsp; % thoi gian lay mau, trong 1 bit chia lam Ns khoang thoi gian
Ns = Nb * (Tb/ts); % So luong mau tren n bit (= Nb*Nsp)
Timewindow = (Ns-1)*ts; % Thoi gian quan sat tin hieu, (tu 0->Ns => co Ns-1 khoang)
t = 0:ts:Timewindow;
y = [];
code = [];
for i=1:Nb
    pol = 2*x(i)-1; % Chuyen bit ve dang luong cuc
    if x(i) == 0 % Neu tin hieu la xung 0 (giu nguyen)
        sig = -1*ones(1, Nsp); % Tao tin hieu cho 1 bit
        code = [code pol]; % Chen bit luong cuc vao khoi ma hoa
    else % Nguoc lai theo ti le r% dau la xung 1, r% sau la xung 0
        sig1 = ones(1, round(r*Nsp)); % Tao tin hieu cho r% dau
        sig2 = -1*ones(1, Nsp-round(r*Nsp)); % Tao tin hieu cho r% sau
        sig = [sig1 sig2]; % Ghep lai 2 thanh phan tin hieu trem ta duoc 1 tin hieu cho 1 bit
        code = [code pol -pol]; % Chen bit luong cuc vao ma hoa, vi la RZ nen moi khi co xung 1 thi ma khoi lai co them 2 bit cua 1 va 0
    end
    y = [y sig]; % Chen cac chuoi tin hieu vao chuoi tin hieu bieu dien dau ra

end
end