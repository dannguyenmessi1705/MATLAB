d = [1 1 0 0 1 0 1 1 0 0 1 0 1 0 1 1 1 1 1 1 1 0 0 1 0 1 1 0];
R = 1e6;
[t,y,code] = nrzcode(d,R);
plot(t,y);
title('xung NRZ');
ylim([-1.5 1.5]);
function [t,y,code] = nrzcode(d,R)
Nb = length(d);
Nsb = 50;
Ns = Nsb*Nb;
T = 1/R;
ts = T/Nsb;
Timewindow = (Ns-1)*ts+0;
t = 0:ts:Timewindow;
y = [];
code = [];
for i=1:Nb
    pol = 2*d(i)-1;
    sig = pol*ones(1, Nsb);
    y = [y sig];
    code = [code pol];
end
end
