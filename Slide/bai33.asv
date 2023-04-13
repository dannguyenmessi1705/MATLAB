%bai 33
clc;
clear all;
fs=20;
A=8; % He so nen
%M=32; % So luong muc luong tu
N=2^7;
f=440;
T0=0;
Tf=5e-3;
Ts=(Tf-T0)/(N-1);
t=T0:Ts:Tf;
x=2*cos(4*pi*f*t);
plot(t,x,'linewidth',1); 
hold on;
fc=f-fs;
xs= 2*cos(4*pi*fc*t);
stairs (t,xs,'g');
hold on;
[y,amax]=Alaw(x,A); % Nen tin hieu
[code,yq,sqnr]=uniform_PCM(y,M); %Ma hoa
xq=invAlaw(yq,A); %Giai nen tin hieu
xq= xq*amax;
amax=amax*10;
xq=xq/amax;
sqnr= 20 *log10(norm(x)/norm(x-xq)); % in dB
stairs(t,xq,'r','linewidth',1);
legend('Tin hieu ban dau','Tin hieu lay mau','Tin hieu luong tu hoa');
axis([0 1.5e-3 -2 2]);

