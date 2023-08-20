w = (0:0.01:5);
H1 = 1./w;
H2 = 1./(1+w.^2).^(1/2);
subplot(211); % do thi bieu dien theo ma tran (2,1) voi vi tri la 1
plot(w, H1);
title('Do thi 1');
xlabel('w');
ylabel('H(jw)');
subplot(212);
plot(w, H2);
title('Do thi 2');
xlabel('w');
ylabel('H(jw)');