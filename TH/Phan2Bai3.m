% Thiet lap thong so cua tin hieu
Ns = 2^9;
t0 = -6;
tf = 6;
ts = (tf-t0)/(Ns-1);
x = t0:ts:tf; % Tao vector x
y = exp(x); % Tao tin hieu y

% Ve tin hieu truoc khi luong tu hoa
plot(x,y,'b');
title('Tin hieu');
xlabel('x');
ylabel('y');
hold on;
% Thuc hien nen bang Alaw
yn = compand(y,87.6, abs(max(y)), 'A/compressor');
% Thuc hien luong tu hoa
M = 16; % So bit luong tu
[code, yq] = PCM(yn, M);
% Thuc hien giai nen Alaw
yc = compand(yq, 87.6, abs(max(yq)), 'A/expander');
sqnr = 20*log10(norm(x)/norm(x-yc));
% Ve tin hieu sau khi luong tu hoa
plot(x,yc, 'r');
legend('Tin hieu truoc khi luong tu hoa', 'Tin hieu sau khi luong tu hoa');

function [code, yq] = PCM(yn, M)
Nb = log2(M);
amax = max(abs(yn));
delta = 2*amax/(M-1);
Mq = -amax:delta:amax;
Ml = 0:M-1;
yq = zeros(size(yn));
xcode = yn;
for i=1:M
    ind = find(yn > Mq(i)-delta/2 & yn <= Mq(i)+delta/2);
    yq(ind) = Mq(i);
    xcode(ind) = Ml(i);
end
code = de2bi(xcode, Nb, 'left-msb');
end