C = 4.7e-6; 
R = 10e3;
%Khoi tao dieu kien ban dau cua RK4
t1=0;
t2=3;
u(1)= 0;
x(1)=0;
h=3e-3;
N=(t2-t1)/h;
f1= @(u) (-1/(R*C))*u + 1/(R*C); %Ham su dung trong RK4
%Tim nghiem = cong thuc RK4
    for i=1:N
        x(i+1)= x(i)+h/2;
        k1 = h* f1(u(i));
        k2=h * f1(u(i)+k1/2);
        k3=h*f1(u(i)+k2/2);
        k4=h*f1(u(i)+k3);
        u(i+1)=u(i)+(1/6) *(k1+2*k2+2*k3+k4);
    end 
    %Khoi tao dieu kien ban dau su dung pp ode45
u0 = 0;% V
t0 = 0; % s
tspan = [0 3]; 
n = 1000;
f = @(t, u) (-1/(R*C)) * u + (1/(R*C)); %Ham su dung trong ode45
% Tính nghi?m b?ng ode45
[ t, u_ode45] = ode45(@(t,u)f(t,u), tspan, u0, n);
% In ket qua ra = pp ode45
subplot(2,1,1);
plot (t,u_ode45,'r', 'linewidth',2)
legend('ode45');
title('Ket qua su dung ode45');
%In ket qua ra = pp RK4 => 2 ket qua giong nhau
subplot(2,1,2)
plot(x,u,'linewidth',2)
axis([0 1 0 1.5])
legend('RK4');
title('Ket qua su dung RK4');



