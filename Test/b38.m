bits = randi([0 1], 1, 5000);
t = linspace(0, length(bits)/100, length(bits));
waveform = zeros(1, length(t));
for i = 1:length(bits)
    if bits(i) == 1
        waveform((i-1)*100+1:i*100) = ones(1,100);
    else
        waveform((i-1)*100+1:i*100) = -ones(1,100);
    end
end
rolloff = 0.5;
span = 10;
sps = 4;
h = rcosdesign(rolloff, span, sps);
filtered_waveform = filter(h, 1, waveform);
figure;
subplot(2,1,1);
plot(t(1:1000),waveform(1:1000));
title('Waveform before filtering');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t(1:1000),filtered_waveform(1:1000));
title('Waveform after filtering');
xlabel('Time (s)');
ylabel('Amplitude');
eyediagram(filtered_waveform,sps*2);