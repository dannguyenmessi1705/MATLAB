%% Chuong trinh vi du ve ma duong truyen RZ 50%
d = [0 0 1 1 0 0 1 1 1 1 1 1 0 1 0 1];
R = 1e6;
Ns = 6e6;
[t,y,code] = nrzcode(d,R,Ns);
plot(t,y);
ylim([-2 2]);
grid on;
function [t,y,code] = nrzcode(d,R,Ns)
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
code = [];
for k = 1:Ns
    % Vi Ns >> => xac dinh n de (n < Nb)
    n = fix(t(k)/Tb)+1; % xac dinh n dang o bit thu may trong chuoi
    if n >= Nb % Neu n>=Nb, de gia tri mac dinh n = gia tri cuoi Nb
        n = Nb;
    end
    if mod(t(k), Tb) <= Tb/2 % Xet 50% chu ky dau la giong 
        y(k) = d(n);
        code(n) = d(n);
    else % 50% chu ky sau ve 0
        y(k) = 0;
    end
end
end