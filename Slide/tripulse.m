function y = tripulse(Tp, fs)
% Tp thoi gian chu ky xung, fs tan so lay mau
Tw = Tp/2;
t = 0:1/fs:Tp-1/fs;
y = 1 - abs((t-Tw)/Tw);
y(y<0) = 0;
plot(t,y);
