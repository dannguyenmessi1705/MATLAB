%% Chuong trinh MATLAB ve xung AMI (xung 1 le thi o duong, 1 chan o am, 0 giu nguyen)
x = [0 0 1 1 0 0 1 1 1 1 1 1 0 1 0 1];
Rb = 1e6;
[t, y, code] = ami(x, Rb);
plot(t,y);
ylim([-1.5 1.5]);
function [t, y , code] = ami(x, Rb)
% x - chuoi bit dau vao
% Rb - toc do bit
% r - ty le xung RZ
Tb = 1/Rb; % Chu ki xung cua 1 bit
Nb = length(x); % So luong bit can bieu dien
Nsp = 50; % So luong mau tren 1 bit
ts = Tb/Nsp; % thoi gian lay mau, trong 1 bit chia lam Ns khoang thoi gian
Ns = Nb * Nsp; % So luong mau tren n bit (= Nb*Nsp)
Timewindow = (Ns-1)*ts; % Thoi gian quan sat tin hieu, (tu 0->Ns => co Ns-1 khoang)
t = 0:ts:Timewindow;
y = [];
code = [];
dem = 1; % Bien dem xung 1 o vi tri chan hay le
for i=1:Nb
    if x(i) == 0 % Neu tin hieu la xung 0 (giu nguyen)
        sig = zeros(1, Nsp); % Tao tin hieu cho 1 bit (0)
        code = [code 0]; % Chen 0 vao khoi ma hoa 
    else % Nguoc lai
        if mod(dem,2) == 1 % Neu xung 1 xuat hien o vi tri le
            sig = ones(1, Nsp); % Tao tin hieu cho bit 1 le (1)
            code = [code 1]; % Chen bit 1 vao khoi ma hoa
        else % Nguoc lai
            sig = -1*ones(1, Nsp); % Tao tin hieu cho bit 1 chan (-1)
            code = [code -1]; % Chen bit -1 vao khoi ma hoa
        end
        dem = dem + 1;
    end
    y = [y sig]; % Chen cac chuoi tin hieu vao chuoi tin hieu bieu dien dau ra
end
end