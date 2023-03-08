function [y] = bai24(t1,t2,h)
a = 1;
r=1;
y(1)=0;
t(1)=0;
N=(t2-t1)/h;
f= @(t,y) r - a* y ;
for i=1:N
    t(i+1)=t(i)+h;
    y(i+1)= y(i)+ f(t(i),y(i))*h;
end
plot (t,y,'ro-', 'linewidth',2)
title('nghiem cua bai toan y(x)')
legend('y(t)');


end

