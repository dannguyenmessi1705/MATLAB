% Thiet lap thong so cua tin hieu
x = -8:0.001:8; % Tao vector x
y = exp(x); % Tao tin hieu y

% Ve tin hieu truoc khi luong tu hoa
plot(x,y);
title('Tin hieu');
xlabel('x');
ylabel('y');
hold on;
axis([4 6 150 500]);
% Thuc hien luong tu hoa
L = 8; % So bit luong tu
delta = (max(y)-min(y))/(2^L); % Tinh bac cua luong tu
y_quantized = round(y/delta)*delta; % Luong tu hoa tin hieu y

% Ve tin hieu sau khi luong tu hoa
plot(x,y_quantized);
legend('Tin hieu truoc khi luong tu hoa', 'Tin hieu sau khi luong tu hoa');