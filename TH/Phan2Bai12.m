% Tao bit
a = 8;
bit_stream = randi([0 1], 1, a*100);

% Toc do tin hieu va kich thuoc lay mau
sampling_rate = a*1e7; % Hz
samples_per_bit = 1;

% Tao tin hieu NRZ luong cuc
nrz = 2 * bit_stream - 1;
n = (0:length(nrz)-1) / sampling_rate;

% Ve do thi truoc khi loc
subplot(2, 1, 1);
plot(n(1:10*samples_per_bit), nrz(1:10*samples_per_bit));
title('Dang tin hieu truoc khi loc');
xlabel('Thoi gian (s)');
ylabel('Bien do');
 
% Loc tin hieu voi bo loc raise-cosine
tx_filter = rcosdesign(0.5, 6, samples_per_bit);
tx_filtered = conv(nrz, tx_filter, 'same');
 
% Ve tin hieu sau loc
subplot(2, 1, 2);
plot(n(1:10*samples_per_bit), tx_filtered(1:10*samples_per_bit));
title('Dang tin hieu sau khi loc');
xlabel('Thoi gian (s)');
ylabel('Bien ?o');
 
% Bieu do mat truoc khi loc
eyediagram(nrz, 2*samples_per_bit);
 
% Bieu do mat sau khi loc
eyediagram(tx_filtered, 2*samples_per_bit);