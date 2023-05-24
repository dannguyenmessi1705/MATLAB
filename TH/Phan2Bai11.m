% Thong so dau vao
M = 64; % Bac dieu che
k = log2(M); % So bit tren moi mau tin hieu
N = 48*50; % So mau tin hieu
EbNo = 10; % Ty so suy giam nang luong bit
N0 = 6; % Cong suat nhieu
symbols = randi([0 M-1],[1 N]); % Chuoi cac mau tin hieu ngau nhien

% Dieu che tin hieu M-QAM
modulated = qammod(symbols, M);

% Them nhieu AWGN vao tin hieu
noisy = awgn(modulated, 10*log10(k*EbNo*N0), 'measured');
% 10*log10(k*EbNo*N0) la SNR, va 'measured' tinh toan lai SNR thuc te

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
title(['Gian do chom sao cua tin hieu sau khi AWGN (Eb/No = ', num2str(EbNo), ' dB)']);