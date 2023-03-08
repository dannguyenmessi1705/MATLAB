clc;
N=1000;
fs=44100;
ts=1/fs;
tmax=(N-1)*ts;
t=0:ts:tmax;
f1= 2* pi* 1*10;
f2=2* pi* 3*10;
f3= 2* pi* 4*10;
s1 = cos(f1*t)+ cos(f2*t+pi/4)+ 2*cos(f3*t);
plot(t,s1)
figure
f= -fs/2:fs/(N-1):fs/2;
z=fftshift(fft(s1));
plot(f,abs(z))
figure
[T]=meshgrid(t);
s = cos(f1*T)+ cos (f2*T+pi/4)+ 2* cos(f3*T);
surf(s)
figure
[F]=meshgrid(f);
z1=fftshift(fft(s));
surf(z1)




