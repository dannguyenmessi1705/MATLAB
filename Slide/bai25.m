function [y] = bai25( t1,t2,h )
a=1;
r=1;
N=(t2-t1)/h;
y(1)=0;
x(1)=0;
f= @(y) r-a*y;
for i=1:N
    x(i+1)=x(i)+(2/3)*h;
    k1=f(y(i))*h;
    k2=f(y(i)+(2/3)*k1)*h;
    k3=f(y(i)+(2/3)*k2)*h;
    y(i+1)=y(i)+(2/8)*k1+(3/8)*k2+(3/8)*k3;
end
plot(x,y,'r', 'linewidth',2)
title (' Do thi nghiem cua bai toan y(t)')
legend('y(t)')

end

%% Cach 2
% a=1;r=1;
% t0=0;
% y0=0; % Ði?u ki?n ban ð?u
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
%     k1 = fun1(y(k),tvec(k));
%     k2 = fun1(y(k)+2*h*k1/3,tvec(k)+2*h/3);
%     k3 = fun1(y(k)+2*h*k2/3,tvec(k)+2*h/3);
%     y(k + 1) = y(k) + h*((2/8)*k1 + (3/8)*k2 + (3/8)*k3);
%     %Công th?c RK-3
%     tvec(k+1) = tvec(k) + h;
%     plot([k - 1 k]*h,[y(k) y(k+1)],'b', k*h,y(k+1),'ro')
%     pause;
% end
% =========================================================
% %”fun1” function
% function yf = fun1(y,t)
% a = 1; r = 1;
% yf = r-a*y;
