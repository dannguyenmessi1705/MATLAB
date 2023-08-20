function [y] = bai24b(t1,t2,h)
a = 1;
r=1;
y(1)=0;
x(1)=0;
N=(t2-t1)/h;
f= @(y) r - a* y ;
for i=1:N
    x(i+1)=x(i)+h;
    y(i+1)= y(i)+ f(y(i))*h;
end
plot (x,y,'r', 'linewidth',2)
title('nghiem cua bai toan y(x)')
legend('y(t)');

end

