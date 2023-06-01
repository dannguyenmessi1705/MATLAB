%% Chuong trinh ve ma duong truyen AMI
d = [0 0 1 1 0 0 1 1 1 1 1 1 0 1 0 1]; 
R = 1e6; 
Ns = 16; 
[t,y,code] = amicode(d,R,Ns);
stairs(t,y);
ylim([-2 2]);
grid on;

function [t,y,code] = amicode(d,R,Ns)
% d - chuoi nhi phan dau vao
% R - Toc do bit
% Ns - So luong mau
% t - vector thoi gian
% y - vector xung dau ra
% code - chuoi ra ma hoa
Tb = 1/R; % Chu ky 1 bit bieu dien thanh 1 xung
Nb = length(d); % So luong bit
Timewindow = Nb*Tb; % Thoi gian quan sat
ts = Timewindow/(Ns-1); % Thoi gian lay mau, chia lam Ns doan
t = 0:ts:Timewindow; % vector thoi gian
y = zeros(size(t)); 
prev = 1; % Bien dem xung
for k = 1:Ns
    % Vi Ns >> => xac dinh n de (n < Nb)
    n = fix(t(k)/Tb)+1; % xac dinh n dang o bit thu may trong chuoi
    if n >= Nb % Neu n>=Nb, de gia tri mac dinh n = gia tri cuoi Nb
        n = Nb;
    end
    if d(n) == 0 % Neu bit vao = 0 => dau ra = 0
        y(k) = 0;
        code(k) = 0;
    else
        prev = prev + 1;
        if mod(prev,2)==0
            y(k) = 1;
            code(k) = 1;
        else
            y(k) = -1;
            code(k) = -1;
        end
    end
end
end