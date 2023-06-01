%% Dieu che bien do AM cho tin hieu x = A*cos(2*pi*f*t+phi)
% A = 8(Bien do), f = 80Hz(Tan so goc), phi = 0(Pha ban dau cua tin hieu goc);
% phic = 0(Pha ban dau cua tin hieu song mang), fc = 480(Tan so song mang)
% Run: AM_ZD(@(A,t,f,phi) A*cos(2*pi*f*t+phi), fc, A, phic)
function ydc = AM_ZD(x, fc, A, phic)
f = 80;
phi = 0;
Ns = 2^9; % So luong lay mau
T0 = 0; % Thoi gian bat dau
Tf = 1/5; % Thoi gian ket thuc
ts = (Tf-T0)/(Ns-1); % Chia khoang thoi gian thanh Ns doan
t = T0:ts:Tf; % Thoi gian xem tin hieu
y = x(A, t, f, phi); % Tin hieu truoc dieu che
subplot(211);
plot(t,y);
title('Tin hieu truoc khi dieu che');
subplot(212);
m = 0.5; % Muc do dieu che
Ac = A/m; % Bien do song mang
yc = Ac*sin(2*pi*fc*t + phic); % Tin hieu song mang (Neu de bai khong cho thi tuy y chon)
ydc = (1+y/Ac).*yc; % Tin hieu sau dieu che theo Cong thuc
plot(t,ydc);
title('Tin hieu sau dieu che');



