% Thiet lap thong so cua tin hieu
x = -8:0.001:8; % Tao vector x
y = exp(x); % Tao tin hieu y

% Ve tin hieu truoc khi luong tu hoa
plot(x,y);
title('Tin hieu');
xlabel('x');
ylabel('y');
hold on;

% Thuc hien luong tu hoa
L = 8; % So bit luong tu
mu = 255; % Luat mu
delta = zeros(size(y)); % Tao vector chua cac bac luong tu
y_quantized = zeros(size(y)); % Tao vector chua tin hieu luong tu hoa
for i = 2:length(y)
    delta(i) = (y(i)-y_quantized(i-1))/mu; % Tinh bac cua luong tu
    y_quantized(i) = y_quantized(i-1) + round(delta(i))*mu; % Luong tu hoa tin hieu y
end

% Ve tin hieu sau khi luong tu hoa
plot(x,y_quantized);
legend('Tin hieu truoc khi luong tu hoa', 'Tin hieu sau khi luong tu hoa');