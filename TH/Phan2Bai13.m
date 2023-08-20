a = 8;
bit_stream = randi([0 1], 1, a*100);

% Signal frequency and sampling rate
signal_freq = a*1e3; % Hz
sampling_rate = a*10e3; % Hz
samples_per_bit = sampling_rate/signal_freq;

% Convert binary stream to NRZ format
nrz = 2 * bit_stream - 1;
n = (0:length(nrz)-1) / sampling_rate;

% Design Butterworth filter
[b, a] = butter(6, signal_freq*2.5/(sampling_rate/2));

% Filter the signal
filtered_signal = filter(b, a, nrz);

% Plot before and after filtering
subplot(2,1,1);
plot(n(1:10*samples_per_bit), nrz(1:10*samples_per_bit));
title('Signal before filtering');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(n(1:10*samples_per_bit), filtered_signal(1:10*samples_per_bit));
title('Signal after filtering');
xlabel('Time (s)');
ylabel('Amplitude');

% Eye diagrams
eyediagram(nrz, 2*samples_per_bit);
eyediagram(filtered_signal, 2*samples_per_bit);