%bai 38
h = randi([0, 1], 1, 5000);% Chuoi 5000 bit ngau nhien [0 1];

Tb = 1 /100e6;
t = 0 : Tb : Tb*(length(h) -1);
NRZ = 2 * h -1;

rolloff = 0.5;
span = 10;
sps = 4;
rrc_filter = rcosdesign(rolloff, span, sps);
filtered_signal = filter(rrc_filter, 1, upsample(h, sps));

subplot(2, 1, 1);
plot(t(1 : 100), h(1 :100));
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal Before Filtering');

subplot(2, 1, 2);
plot(t(1 : length(filtered_signal) / sps), filtered_signal(1 : length(filtered_signal) / sps));
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal After Filtering');

eyediagram(filtered_signal, 2 *sps);
title('Eye Diagram of Filtered Signal');
