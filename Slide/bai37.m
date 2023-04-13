%bai 37
Fc=300;
T0=0;
Tf=0.3;
Fs=1000;
Ts=1/Fs;
t=T0:Ts:Tf;
subplot(3,1,1);
s=2*cos(20*pi*t+pi/4)+cos(30*pi*t);
plot(t,s,'b','linewidth',1.5);
title('Tin hieu ban dau');
subplot(3,1,2);
phic=pi/4;
y=ammod(s,Fc,Fs,phic);
plot(t,y,'g','linewidth',1.5);
title('Tien hieu dieu che bien do');
subplot(3,1,3);
sr=amdemod(y,Fc,Fs,phic);
plot(t,sr,'r','linewidth',1.5);
title('Tin hieu giai dieu che');



