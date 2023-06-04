%% Chuong trinh vi du ve nhieu kenh AWGN
% Gia su ta co tin hieu, dieu che va di qua bo loc
% Tin hieu nay bi nhieu boi AWGN voi SNRdB = 6dB
function yNoise = AWGN_ZD(yClean, SNRdB)
% yNoise - tin hieu ra sau nhieu, yClean - tin hieu vao truoc khi bi nhieu
% SNRdB - ty so cong suat tren tap am (dB)'
SNR = 10^(SNRdB/10); % Chuyen SNRdB ve thang do tuyen tinh
P0 = var(yClean)/SNR; % Tinh phuong sai nhieu
% Them nhieu
if isreal(yClean) % Neu tin hieu vao khong phai la tin hieu phuc
    yNoise = yClean + sqrt(P0)*randn(size(yClean));
else % Nguoc lai tin hieu vao la tin hieu phuc
    yNoise = yClean + sqrt(P0/2)*(randn(size(yClean))+1i*randn(size(yClean)));
end
end
