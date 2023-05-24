function [t, y] = bai29(b, T)
N = b+2;    %so xung can ve
fs=1e2;
t=0 : 1/fs: N;
dem =1;
fs=100;
f=@(t) exp((t.^2));
t=[];
y=[];
for i=0:N-1
    t1=i*T : 1/fs : (i+1)*T-1/fs; 
    st1=f(t1-i*T); 
    t=[t,t1];
    y=[y,st1];
end
plot(t,y);
grid on;
title(sprintf('%d xung hàm e^{x^2} co chu ki la %.2f', N, T));
xlabel('Thoi gian (s)');
ylabel('Bien do');
