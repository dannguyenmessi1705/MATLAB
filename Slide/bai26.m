function [y] = bai26( t1,t2,h )
a=1;
r=1;
N=(t2-t1)/h;
y(1)=0;
x(1)=0;
f= @(y) r-a*y
for i=1:N
    x(i+1)= x(i)+h/2;
    k1 = h* f(y(i));
    k2=h * f(y(i)+k1/2);
    k3=h*f(y(i)+k2/2);
    k4=h*f(y(i)+k3);
    y(i+1)=y(i)+(1/6) *(k1+2*k2+2*k3+k4);
end
plot (x,y,'k','linewidth',2);
legend('y(t)');
title('Do thi nghiem y(t)')
end
%% Cach 2
% clear, clf
% a=1;r=1;
% t0=0;
% y0=0; % �i?u ki?n ban �?u
% tf=2;
% 
% t = [0:0.01:tf]; 
% yt=1-exp(-a*t); % nghi?m c?a PTVT
% plot(t,yt,'k'), hold on
% 
% h = 1/4;
% klast = (tf-t0)/h;
% 
% y(1) = y0;
% tvec(1) = t0;
% for k = 1:klast
%     k1 = feval(@fun1,y(k),tvec(k));
%     k2 = feval(@fun1,y(k)+h*k1/2,tvec(k)+h/2);
%     k3 = feval(@fun1,y(k)+h*k2/2,tvec(k)+h/2);
%     k4 = feval(@fun1,y(k)+h*k3,tvec(k)+h);
%     y(k + 1) = y(k) + h*(k1 + 2*k2 + 2*k3 + k4)/6; %C�ng th?c RK-4
%     tvec(k+1) = tvec(k) + h;
%     plot([k - 1 k]*h,[y(k) y(k+1)],'b', k*h,y(k+1),'ro')
%     pause;
% end
% 
% %�fun1� function
% function yf = fun1(y,t)
% a = 1; r = 1;
% yf = r-a*y;

