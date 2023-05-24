function rect = bai27(b, T)
N=b+2; % so xung can ve
fs=1000;
% T do rong xung
t=[]; y=[];
for i=0:N-1
    t1= i*T+1/fs :1/fs : (i+1/2)*T
    y1(1:length(t1)) = 1;
    t2= (i+1/2)*T+1/fs :1/fs : (i+1)*T;
    y2(1:length(t2)) = 0;
    t = [t,t1,t2];
    y = [y,y1,y2];
end
plot(t,y,'lineWidth', 2);
title(sprintf('Chuoi %d xung chu nhat voi chu ky %.2fs', N, T));
xlabel('time');
ylabel('Amplitude');
grid on;
