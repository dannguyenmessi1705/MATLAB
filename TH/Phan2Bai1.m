% Thiet lap thong so cua tin hieu
a = 8; % Chu ky T
A = 1.5*a; % Bien do
Fs = 32/(2*a); % Tan so lay mau
t = 0:1/Fs:2*a-1/Fs; % Tao vector thoi gian

% Tao tin hieu sin
x = A*sin(2*pi*t/a);

% Ve tin hieu truoc khi lay mau
subplot(2,1,1);
plot(t,x);
title('Tin hieu truoc khi lay mau');
xlabel('Thoi gian (s)');
ylabel('Bien do');

% Lay mau tin hieu
Fs_new = 32*2/a; % Tan so lay mau moi
x_new = resample(x, Fs_new/Fs, 1);

% Tao vector thoi gian moi
t_new = 0:1/Fs_new:2*a-1/Fs_new;

% Ve tin hieu sau khi lay mau
subplot(2,1,2);
stem(t_new, x_new);
title('Tin hieu sau khi lay mau');
xlabel('Thoi gian (s)');
ylabel('Bien do');