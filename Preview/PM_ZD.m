%% Dieu che PM voi do sau dieu che m=0.4
f = 20;
fc = 480;    % Tan so song mang
fs = fc*16; % Tan so lay mau cua tin hieu am thanh dau vao
m = 0.4;        % do sau dieu che
pdev = m * pi;  % Do bien doi pha cua song mang (theo CT cua PM)
Ns = 2^9; % Toc do lay mau
t0=0; % thoi gian dau
tf=1/5; % thoi gian ket thuc
ts = (tf-t0)/(Ns-1); % thoi gian lay mau
t = 0:ts:tf;   % Thoi gian tu 0 den 1 giay voi buoc lay mau la 1/ts
x = sin(2*pi*20*t); % Tin hieu am thanh dau vao (tin hieu song sine tan so 20Hz)
y = pmmod(x, fc, fs, pdev); % Dieu che PM

% Ve do thi tin hieu am thanh dau vao va tin hieu PM
subplot(2,1,1);
plot(t, x);
title('Tin hieu am thanh dau vao');
xlabel('Thoi gian (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, y);
title('Tin hieu PM');
xlabel('Thoi gian (s)');
ylabel('Amplitude');