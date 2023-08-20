% Bit vao
N = 48;
bit_sequence = randi([0 1], 1 ,N);

% Thong so dieu che ASK
bit_rate = 1000;  % Toc do bit
carrier_freq = 10000;  % Tan so song mang
amplitude_0 = 0;  % Bien do khi bit = 0
amplitude_1 = 1;  % Bien do khi bit = 1

% Thoi gian mau hoa
sampling_freq = 10 * bit_rate;  % Tan so lay mau
sampling_period = 1 / sampling_freq;  % Chu  ky lay mau
t = 0:sampling_period:(length(bit_sequence) * sampling_period);  % Truc thoi gian

% Tao tin hieu ASK
ask_signal = zeros(size(t));  % Khoi tao tin hieu ASK ban dau

for i = 1:length(bit_sequence)
    if bit_sequence(i) == 0
        ask_signal((i-1)*sampling_period <= t & t < i*sampling_period) = amplitude_0;
    else
        ask_signal((i-1)*sampling_period <= t & t < i*sampling_period) = amplitude_1;
    end
end

% Hien thi do thi tin hieu ASK
subplot(2, 1, 1);
plot(t, ask_signal);
title('Tin hieu ASK');
xlabel('Thoi gian (s)');
ylabel('Bien do');

% Giai dieu che ASK
demodulated_bits = zeros(1, length(bit_sequence));  % Khoi tao chuoi bit giai dieu che

for i = 1:length(bit_sequence)
    if ask_signal((i-1)*sampling_period <= t & t < i*sampling_period) == amplitude_0
        demodulated_bits(i) = 0;
    else
        demodulated_bits(i) = 1;
    end
end

% Hien thi  chuoi bit giai dieu che
subplot(2, 1, 2);
stem(demodulated_bits);
title(' chuoi bit giai dieu che');
xlabel('Thoi gian (s)');
ylabel('Bit');

% Tao chuoi bit dau vao va chuoi bit giai dieu che
input_bits = mat2str(bit_sequence);
output_bits = mat2str(demodulated_bits);

% Hien thi ket qua
disp(['Bit input  :  ' input_bits(2:end-1)]);
disp(['Bit output:  ' output_bits(2:end-1)]);