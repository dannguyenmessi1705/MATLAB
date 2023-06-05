% Thiet lap cac thong so
n=2000; % Chieu dai chuoi bit
M=4; % M PSK
k=log2(M);% So bit trong 1 ky hieu
Rb=5e3; % Toc do bit
Rsym= Rb/k; %Toc do ky hieu
Tsym=1/Rsym; % Chu ky ky hieu
fs= 32*Rb; % Tan so lay mau
Ts=1/fs; %Chu ky lay mau
fc=4*Rb; % Tan so song mang
Es=4; % Nang luong ky hieu
Phi0= 0; %Pha ban dau
Nsamp= n*(fs/Rsym); % Tong so mau
%Dieu che
dataInput= randi([0, M-1],1,n); %Chuoi ky hieu dau vao
modData= qammod(dataInput,M); %Chuoi ky hieu dieu che M-PSK
% Xac dinh p(t) 
tc= 0:Ts:Tsym; % Thoi gian 1 chu ky ky hieu
r=zeros(1, length(tc));

r(tc<1.5*Tsym & tc>=0.5*Tsym) = 1;
r(tc>=1.5*Tsym | tc<0.5*Tsym) = 0;
pt= sqrt((2*Es)/Tsym).*r;
% Mo phong tuong duong bang goc
st=[]; %Tin hieu phat
t=[]; %Khoang thoi gian xet
for k=1:n
    st1= modData(k) *pt *exp(1i*Phi0);
    st=[st st1];
    t=[t tc+(k-1)*Tsym];
end
% Bo loc phia phat
st_filter= raisecosineflt(st, Rb, Ts, 1);
stc= st_filter.* exp(1i*2*pi*fc*t);
% Kenh truyen AWGN
N0=8;
N0= 10^(N0/10);
snr= Es/N0- 10*log10(Nsamp);
% snr= 10^(snr/10);
dataNoisy= awgn(modData, snr, 'measured');
Noisy= awgn(stc,snr,'measured');
% Bo loc phia thu
data_Receive= Noisy.* exp(-1i*2*pi*fc*t).*exp(-1i*Phi0);

% Ve tin hieu
figure
plot(t,stc); title('Tin hieu dieu che trc khi qua kenh truyen');
figure
plot(t,data_Receive); 
title('Tin hieu dieu che sau khi di qua kenh truyen');
% Ve do thi chom sao
scatterplot(modData,1,0,'ro');
scatterplot(dataNoisy, 1,0,'bx');
% Ve bieu do mat
eyediagram(real(modData),20);
eyediagram(real(dataNoisy),20);


% Chuong trinh con
function y= raisecosineflt(x,Rb,Ts,beta)
    Ns=length(x);
    Tb=1/Rb;
    beta=beta*Rb;
    f= [0:Ns/2-1 -Ns/2:-1]/(Ns*Ts);
    Xf= fft(x);
    Yf= zeros(1, length(x));
    ind= abs(f) <= Rb/2 - beta;
    Yf(ind)= Xf(ind).*Tb;
    ind= abs(f) > Rb/2 - beta & abs(f) <= Rb/2+beta;
    Yf(ind)= Xf(ind).* (Tb.* (cos ((pi/(4*beta)).*(abs(f(ind))-Rb/2+beta))).^2);
    ind= abs(f) > Rb/2+beta;
    Yf(ind)=Xf(ind).*0;
    y=ifft(Yf)./Tb;
end