%% Luong tu hoa khong deu theo luat A
% Luong tu hoa chuoi x dau vao voi so muc luong tu la M (M phai co log2)
M = 32; % So muc luong tu hoa
A = 87.6; % Hang so nen luat A
T0 = 0; % Thoi gian bat dau
Tf = 3; % Thoi gian ket thuc
Ns = 2^9; % so luong lay mau
ts = (Tf-T0)/(Ns-1); % Buoc nhay thoi gian
t = T0:ts:Tf;
x = 8*exp(2*t)+3*t;
subplot(2,2,1:2);
plot(t, x);
grid on;
title('Tin hieu truoc khi luong tu hoa');
subplot(223);
y = compand(x,87.6,max(x),'A/compressor');
plot(t,y,'b');
hold on;
[code, yq, ~] = PCM(y, M); % ma hoa, luong tu hoa tin hieu
plot(t,yq,'r');
grid on;
title('Tin hieu nen va duoc luong tu hoa');
subplot(224);
xq = compand(yq,87.6,max(yq),'A/expander');
sqnr = 20*log10(norm(x)/norm(x-xq)); % Tinh ti so tin hieu nhieu theo cong thuc
plot(t,x,'b');
hold on;
plot(t,xq,'r');
grid on;
title('Tin hieu goc va tin hieu luong tu hoa sau khi giai nen');

function [code, yq, sqnr] = PCM(x, M)
% x - Chuoi vao, M - so muc luong tu hoa
% code - chuoi dau ra sau khi ma hoa co size = ([], log2(M))
% xq - chuoi da duoc luong tu hoa truoc khi ma hoa
% sqnr - Tin hieu nhieu trong qua tring luong tu hoa
Nb = log2(M); % So bit de tao thanh ma tran ma hoa (so muc chia tren do thi) (co size = ([], log2(M)))
Amax = max(abs(x)); % Tim gia tri lon nhat cua tin hieu x (o ca 2 chieu (+) va chieu (-))
delta = 2*Amax/(M-1); % Chia khoang cach giua 2 bien thanh M muc (Tim khoang cach giua cac muc tin hieu)
Mq = -Amax:delta:Amax; % Tao vector Mq 
Ml = 0:M-1; % Tao vector chua cac muc luong tu
yq = zeros(size(x)); % Tao vecto 0 cho chuoi luong tu xq
xcode = yq; % Tao vecto ma hoa
for i=1:M
    pos = find(x > Mq(i)-delta/2 & x <= Mq(i)+delta/2); % Tim vi tri cac phan tu trong x thoa man Mq(i)-delta/2 < x <= Mq(i)+delta/2
    yq(pos) = Mq(i); % Tu vi tri vua tim duoc, ta gan tat ca vi tri do trong xq == Mq(i)
    xcode(pos) = Ml(i); %v Tuong tu, ta gan tat ca vi tri trong xcode = so muc ma hoa tuong ung Ml(i)
end
sqnr = 20*log10(norm(x)/norm(x-yq)); % Tinh ti so tin hieu nhieu theo cong thuc
code = de2bi(xcode, Nb, 'left-msb'); % Chuyen cac muc luong tu (0-M) ve ma hoa chuoi nhi phan 
end
