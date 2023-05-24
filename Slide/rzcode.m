function [t,y,code] = rzcode(d,R,Ns) 
% Chuong trinh ví d? ve ma duong truyen R
% d   chuoi du lieu dau vao 
% R   toc do du lieu 
% Ns   so luong mau 
% t    vecto thoi gian 
% y    vecto mau tín hieu 

Tb = 1/R;  % chu ki bit 
Nb = length(d);  % do dai chuoi bit 
Timewindow = Nb*Tb; % thoi gian cua so 
ts = Timewindow/(Ns-1); % thoi gian lay mau 
t = 0:ts:Timewindow; % vecto thoi gian 

y = zeros(size(t)); % tao vecto y toan so 0
code = [];% khoi tao vecto ma

for k = 1:Ns 
    n = fix(t(k)/Tb)+1; % lay phan nguyen cua t(k)/Tb cong them 1
if n >= Nb 
        n = Nb; 
end;
if mod(t(k),Tb)<=Tb/2 % lay phan du cua t(k)/Tb so sanh voi Tb/2
        y(k) = d(n); 
        code(n) = d(n); 
else
        y(k) = 0; 
end;
end;