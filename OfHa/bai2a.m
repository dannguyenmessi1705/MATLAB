% Bai 2
clc;
clear all;
% Khoi tao cac tham so can thiet
A1=1;
f1=10;
phi1=0;
A2=1;
f2=30;
phi2=pi/4;
A3=2;
f3=40;
phi3=0;

N=2^6;
T0=0;%Thoi diem bat dau
Tf=10e-2; %Thoi diem ket thuc
Ts=(Tf-T0)/(N-1); %Chu ky lay mau
fs=1/Ts; %Tan so lay mau

% Ve tin hieu s(t) va pho tren cua so 2D
figure(1);
t=T0:Ts:Tf;
s=A1*cos(2*pi*f1*t+phi1)+ A2*cos(2*pi*f2*t+phi2)+A3*cos(2*pi*f3*t+phi3);
plot(t*1e3,s,'r');
xlabel('Thoi gian');
ylabel('Bien do');
title('Do thi tin hieu s(t) 2D');
grid;
figure(2);
[f,Xf]=Spectrocal(t,s);
semilogy(f,Xf);
xlabel ('Tan so');
ylabel(' Pho X(f)');
title('Pho cua tin hieu s(t) 2D');
grid;

%Ve tin hieu s(t) va pho tin hieu tren cua so 3D
figure(3);
[T]=meshgrid(t);
sT= A1*cos(2*pi*f1*T+phi1)+ A2*cos(2*pi*f2*T+phi2)+A3*cos(2*pi*f3*T+phi3);
surf(sT);
title('Ve tin hieu s(t) tren 3D');
figure(4);
[F]=meshgrid(f);
[X_f]=meshgrid(Xf);
surf(X_f);
title('Pho tin hieu s(t) tren cua so 3D');

% Ve s(t) tren cua so con theo tung gia tri cua i
figure(5);
subplot(3,1,1);
s1=A1*cos(2*pi*f1*t+phi1)+ A2*cos(2*pi*f1*t+phi2)+A3*cos(2*pi*f1*t+phi3);
plot(t,s1,'r');
title('s(t) voi f1');
subplot(3,1,2);
s2=A1*cos(2*pi*f2*t+phi1)+ A2*cos(2*pi*f2*t+phi2)+A3*cos(2*pi*f2*t+phi3);
plot(t,s2,'b');
grid;
title('s(t) voi f2');
subplot(3,1,3);
s3=A1*cos(2*pi*f3*t+phi1)+ A2*cos(2*pi*f3*t+phi2)+A3*cos(2*pi*f3*t+phi3);
plot(t,s3);
grid;
title('s(t) voi f3');

% Ve pho cua tin hieu tren cua so con voi tung tan so 
figure(6);
subplot(3,1,1);
s1=A1*cos(2*pi*f1*t+phi1)+ A2*cos(2*pi*f1*t+phi2)+A3*cos(2*pi*f1*t+phi3);
[f,Xf1]= Spectrocal(t,s1);
semilogy(f,Xf1);
axis([-100 100 -100 10]);
grid;
title(' Pho s(t) voi f1');
subplot(3,1,2);
s1=A1*cos(2*pi*f2*t+phi1)+ A2*cos(2*pi*f2*t+phi2)+A3*cos(2*pi*f2*t+phi3);
[f,Xf2]= Spectrocal(t,s1);
semilogy(f,Xf2);
axis([-100 100 -100 10]);
grid;
title(' Pho s(t) voi f2');
subplot(3,1,3);
s3=A1*cos(2*pi*f3*t+phi1)+ A2*cos(2*pi*f3*t+phi2)+A3*cos(2*pi*f3*t+phi3);
[f,Xf3]= Spectrocal(t,s3);
semilogy(f,Xf3);
grid;
axis([-100 100 -100 10]);
title(' Pho s(t) voi f3');

