M = 16; % 16-PSK
N = 200; %do dai chuoi bit
A = randi([0 M-1], 1 , N); % tao chuoi 200 bit
msg = pskmod(A, M); % dieu che
scatterplot(msg, 1, 0, 'bp'); % bieu do chom sao
am = abs(msg); % bien do
phase = angle(msg); % goc
figure
subplot(2,1,1);
plot(1:N, am);
subplot(2,1,2);
plot(1:N, phase);
