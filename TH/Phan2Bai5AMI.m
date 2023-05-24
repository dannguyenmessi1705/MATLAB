d = [1 1 0 0 1 0 1 1 0 0 1 0 1 0 1 1 1 1 1 1 1 0 0 1 0 1 1 0]; 
R = 6e3; 
Ns =20; 
[t,y,code] = amicode(d,R,Ns);
stairs(t,y);
ylim([-2 2]);

function [t,y,code] = amicode(d,R,Ns)
% Chuong trinh vi du ve ma AMI
% d - the data sequence
% R - the data rate
% Ns - the number of samples
% t - the time vector output
% y - the vector output of the pulse samples
% code - the AMI code
Tb = 1/R; % bit period
Nb = length(d); % number of bits
Timewindow = Nb*Tb; % time window
ts = Timewindow/(Ns-1); % sampling time
t = 0:ts:Timewindow; % time vector
y= zeros(size(t));
code = zeros(size(d));
prev = 0; % Bien luu cac gia tri truoc do
for k = 1:Ns
    n = fix(t(k)/Tb)+1;
    if n >= Nb
        n = Nb;
    end
    if d(n) == 0
        y(k) = 0;
        code(n) = 0;
    else
        if prev == 0
            y(k) = 1;
            code(n) = 1;
            prev = 1;
        else
            y(k) = -1;
            code(n) = -1;
            prev = 0;
        end
    end
end
end