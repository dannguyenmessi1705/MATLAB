function rect = bai27(b, T)
N = b+2;
t = linspace(0,T*N,1000*N);  % tao vecto thoi gian (0 -> T*N co lay mau 1000*N phan tu)
x = square(2*pi*t/T, 50);    % tao chuoi xung chu nhat voi chu ki 2 giay va duty cycle la 50%
plot(t,x, 'lineWidth', 2); % ve bieu do
title(sprintf('Chuoi %d xung chu nhat voi chu ky %.2fs', N, T));
xlabel('time');
ylabel('Amplitude');
grid on;
axis([0 10*T -2 2]);