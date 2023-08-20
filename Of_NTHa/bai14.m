%bai 14
w=0.01:0.01:5;
A= w.^-1;
f=-atan(w/0) ;
subplot(2,1,1);
plot(w,A,'linewidth',2);
legend('bien do');
title ('Do thi bien do ham truyen H(jw)=1/jw');
axis ([0 3 0 30]);
subplot(2,1,2)
plot(f,'r','linewidth',2);
axis([1 3 -pi 0])
legend('pha');
title ('Do thi pha ham truyen H(jw)=1/jw');
figure
w=0.01:0.01:5;
A= (1+w.^2).^(-0.5);
f=- atan(w);
subplot(2,1,1);
plot(w,A,'linewidth',2);
legend('bien do');
title ('Do thi bien do ham truyen H(jw)=1/1+jw');
subplot(2,1,2)
plot(w,f,'r','linewidth',2);
legend('pha');
title ('Do thi pha ham truyen H(jw)=1/1+jw');
