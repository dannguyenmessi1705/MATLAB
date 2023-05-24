function y = tripulse(Tp, fs)
% Tp thoi gian chu ky xung, fs tan so lay mau
Tw = Tp/2;
t = 0:1/fs:Tp-1/fs;
y = 1 - abs((t-Tw)/Tw);
y(y<0) = 0;
plot(t,y);
%% Cach 2
% Bài 36
function tg = tamgiac(Tp,n) 
% n la so chu ki muon ve
% Tp là chu ki xung
Tw=Tp/2;
for i=0:n-1
x=[i*Tp:0.0001:(i+1)*Tp]; % vector thoi gian
fx=1-abs(((x-i*Tp)-Tw)/Tw); % tinh gia tri ham tai tung thoi diem
plot(x,fx)
hold on
end
