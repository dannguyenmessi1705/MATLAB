%% Chuong trinh MATLAB ve xung NRZ
x = randi([0 1], 1, 20);
Rb = 1e6;
[t, y , code] = nrz(x, Rb);
plot(t,y);
ylim([-1.5 1.5]);
function [t, y , code] = nrz(x, Rb)
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
    pol = 2*x(i)-1; % chuyen bit ve dang luong cuc
    sig = pol*ones(1, Nsp); % Tao chuoi tin hieu cho 1 bit
    y = [y sig]; % Chen tin hieu vao chuoi dau ra tin hieu bieu dien y
    code = [code pol]; % Chen cac bit luong cuc vao khoi ma hoa
end
end