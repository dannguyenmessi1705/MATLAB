Ns = 2^9;
t0 = -6;
tf = 6;
ts = (tf-t0)/(Ns-1);
t = t0:ts:tf;
x = exp(t);
plot(t,x,'b');
hold on;
title('Tin hieu truoc va sau luong tu hoa');
[code, xq, sqnr] = PCM(x, 16);
plot(t,xq,'r');

function [code, xq, sqnr] = PCM(x, M)
Nb = log2(M);
Amax = max(abs(x));
delta = 2*Amax/(M-1);
Mq = -Amax:delta:Amax;
Ml = 0:(M-1);
xq = zeros(size(x));
xcode = xq;
for i=1:M
    ind = find(x > Mq(i)-delta/2 & x <= Mq(i)+delta/2);
    xq(ind) = Mq(i);
    xcode(ind) = Ml(i);
end
sqnr = 20*log10(norm(x)/norm(x-xq));
code = de2bi(xcode, Nb, 'left-msb');
end
