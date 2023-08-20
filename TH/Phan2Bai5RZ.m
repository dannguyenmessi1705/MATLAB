d = [1 1 0 0 1 0 1 1 0 0 1 0 1 0 1 1 1 1 1 1 1 0 0 1 0 1 1 0];
R = 1e6;
r = 0.5; % 50%
[t,y,code] = rzcode(d,R,r);
plot(t,y);
ylim([-1.5 1.5]);
title('RZ 50%');
function [t,y,code] = rzcode(d,R,r)
Nb = length(d);
Nsb = 50;
T = 1/R;
Ns = Nsb*Nb;
ts = T/Nsb;
t0 = 0;
tf = (Ns-1)*ts+t0;
t = t0:ts:tf;
y = [];
code = [];
for i=1:Nb
    pol = 2*d(i)-1;
    if d(i) == 0
        sig = pol*ones(1, Nsb);
        code = [code pol];
    else
        sig1 = ones(1, round(r * Nsb));
        sig2 = -1 * ones(1, Nsb - round(r*Nsb));
        code = [code pol -pol];
        sig = [sig1 sig2];
    end
    y = [y sig];
end
end