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

