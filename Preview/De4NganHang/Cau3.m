T = 5;
Nsp =50;
ts = T/Nsp;
Np = 4;
Ns = Nsp*ts;
t = 0:ts:Np*T + (Np-1)*ts;
y = [];
for i=1:Np
    for t1=0:ts:T
        if t1>0 & t1<=T/2
            y1 = 1;
        else
            y1 = 0;
        end
        y = [y y1];
    end
end
plot(t,y);