% Ma hoa nguon su dung qua trinh PCM luong tu deu
function [code,xq,sqnr]= uniform_PCM(x,M)
% x:  Tin hieu dau vao
% M: so luong luong tu hoa
% code: Dau ra ma hoa
% xq: Tin hieu luong tu truoc khi ma hoa
% sqnr: Ti le nhieu cua tin hieu luong tu (dB)
Nb=log2(M); % So luong bit trong tu ma
Amax=max(abs(x));
delta=2*Amax/(M-1);
Mq=-Amax:delta:Amax;
M1=0:M-1;

xq=zeros(size(x));
xcode=xq;
for k=1:M
    ind=find(x > Mq(k)-delta/2 & x <= Mq(k)+delta/2);
    xq(ind)=Mq(k);
    xcode(ind)=M1(k);
end
sqnr= 20* log10(norm(x)/norm(x-xq));% Tinh ti so tren nhieu luong tu
code= de2bi(xcode,Nb,'left-msb'); %Chuyen doi sang nhi phan


