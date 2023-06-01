%% dieu che FM voi do sau dieu che m=0.4
f = 20;
fc = 480;    % Tan so song mang
fs = fc*16; % Tan so lay mau cua tin hieu am thanh dau vao
m = 0.4;        % do sau dieu che
fdev = m * fs;  % do bien doi tan so cua song mang theo CT
Ns = 2^9; % Toc do lay mau
t0=0; % thoi gian dau
tf=1/5; % thoi gian ket thuc
ts = (tf-t0)/(Ns-1); % thoi gian lay mau
t = 0:ts:tf;   % Thoi gian tu 0 den 1 giay voi buoc lay mau la ts
x = sin(2*pi*f*t); % Tin hieu am thanh dau vao (tin hieu song sine tan so 20Hz)
y = fmmod(x, fc, fs, fdev); % dieu che FM

% Ve do thi tin hieu am thanh dau vao va tin hieu FM
subplot(2,1,1);
plot(t, x);
title('Tin hieu am thanh dau vao');
xlabel('Thoi gian (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, y);
title('Tin hieu FM');
xlabel('Thoi gian (s)');
ylabel('Amplitude');