% Thong so dau vao
M = 16; % Bac dieu che
k = log2(M); % So bit tren moi mau tin hieu
N = 48*50; % So mau tin hieu
SNR = 16; % SNR (dB)
a = random_string - '0';
symbols = randi([0 M-1], [1 N]); % Chuoi cac mau tin hieu ngau nhien

% Dieu che tin hieu M-PSK
modulated = pskmod(symbols,M);
% Them nhieu AWGN vao tin hieu
noisy = awgn(modulated, SNR, 'measured');
% Ve gian do chom sao cua tin hieu dieu che
figure;
subplot(2,1,1);
scatter(real(modulated), imag(modulated), 'filled');
xlabel('Phan thuc');
ylabel('Phan ao');
title('Gian do chom sao cua tin hieu sau khi dieu che');

% Ve gian do chom sao cua tin hieu sau khi AWGN
subplot(2,1,2);
scatter(real(noisy), imag(noisy), 'filled');
xlabel('Phan thuc');
ylabel('Phan ao');
title(['Gian do chom sao cua tin hieu sau khi AWGN (SNR = ', num2str(SNR), ' dB)']);