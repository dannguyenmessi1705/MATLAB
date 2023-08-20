% Thiet lap thong so cua tin hieu
x0 = -6;
xf = 6;
Ns = 2^9;
xs = (xf-x0)/(Ns-1);
x = x0:xs:xf; % Tao vector x
y = exp(x); % Tao tin hieu y

% Ve tin hieu truoc khi luong tu hoa
plot(x,y);
title('Tin hieu');
xlabel('x');
ylabel('y');
hold on;
% Thuc hien nen Mu Law
mu = 255;
[yn, amax] = mulaw(y, mu);
% Thuc hien luong tu hoa
M = 16; % So bit luong tu
[code, yq] = pcm(yn, M);
% Thuc hien giai nen
yc = invmulaw(yq, mu);
yc = yc.*amax;
sqnr = 20*log10(norm(y)/norm(y-yc));
% Ve tin hieu sau khi luong tu hoa
plot(x,yc);
legend('Tin hieu truoc khi luong tu hoa', 'Tin hieu sau khi luong tu hoa');
function [yn, amax] = mulaw(y, mu)
amax = max(abs(y));
yn = sign(y).*(log(1+mu*abs(y/amax)))/log(1+mu);
end

function [code, yq]  = pcm(yn, M)
amax = max(abs(yn));
delta = 2*amax/(M-1);
Nb = log2(M);
Mq = -amax:delta:amax;
Ml = 0:M-1;
yq = zeros(size(yn));
xcode = yq;
for i=1:M
    ind = find(yn > Mq(i)-delta/2 & yn <= Mq(i)+delta/2);
    yq(ind) = Mq(i);
    xcode(ind) = Ml(i);
end
code = de2bi(xcode, Nb, 'left-msb');
end

function yc = invmulaw(yq, mu)
yc = sign(yq).*((1+mu).^abs(yq)-1)/mu;
end