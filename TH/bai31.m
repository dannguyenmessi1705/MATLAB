function tc = bai31(N)
t = 0:0.01:N;
x = sin(t);
y = cos(t);
% Tinh tich chap, 'full' tinh toan ket qua tich chap cho toan bo kich thuoc
% dau vao, ko cat bot kq
tc = conv(x, y, 'full');
plot(tc);