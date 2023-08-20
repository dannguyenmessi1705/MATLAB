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

