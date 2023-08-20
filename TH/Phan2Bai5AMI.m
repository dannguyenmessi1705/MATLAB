d = [1 1 0 0 1 0 1 1 0 0 1 0 1 0 1 1 1 1 1 1 1 0 0 1 0 1 1 0]; 
Rb = 1e6;
[t,y,code] = amicode(d,Rb);
plot(t,y);
ylim([-1.5 1.5]);
grid on;
title('Chuoi AMI');

function [t,y,code] = amicode(d,Rb)
Tb = 1/Rb;
Nsb = 50;
Nb = length(d);
ts = Tb/Nsb;
Ns = Nb*Nsb;
Timewindow = (Ns-1)*ts;
t = 0:ts:Timewindow;
y= [];
code = [];
dem = 1;
for k = 1:Nb
    if d(k) == 0
        sig = zeros(1, Nsb);
        code = [code 0];
    else
        if mod(dem,2)==1
            sig = ones(1, Nsb);
            code = [code 1];
        else
            sig = -1 * ones(1, Nsb);
            code = [code -1];
        end
        dem = dem+1;
    end
    y = [y sig];
end
end