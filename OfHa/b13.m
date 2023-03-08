%bai 13
clc;
clear all;
w=(0.01 : 0.01 :5);
g= w.^-1;
f= (1+w.^2).^(-0.5);
plot (w,g,'linewidth',2)
axis([0 3 0 30])
title('do thi bien do H(jw)=1/jw')
xlabel ('truc-tanso')
ylabel ('truc-biendo')
figure
plot(w,f,'r', 'linewidth',2);
title('do thi bien do H(iw)=1/1+jw')
xlabel ('truc-tanso')
ylabel ('truc-biendo')
figure
subplot(3,1,1);
semilogx(w,f,'k','linewidth',2);
legend('semilogx')
subplot(3,1,2);
semilogy(w,f,'r','linewidth',2);
legend('semilogy')
subplot(3,1,3);
loglog(w,f, 'linewidth',2);
legend('loglog');



