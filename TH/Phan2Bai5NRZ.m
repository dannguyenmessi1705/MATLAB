d = [0 0 1 1 0 0 1 1 1 1 1 1 0 1 0 1];
R = 6e6;
Ns = 6e6;
[t,y,code] = nrzcode(d,R,Ns,'pol');
plot(t,y);
ylim([-2 2]);
function [t,y,code] = nrzcode(d,R,Ns,type)
% Chuong trinh vi du ve ma duong truyen NRZ
% d - the data sequence
% R - the data rate
% Ns - the number of samples
% t - the time vector output
% y - the vector output of the pulse samples
% type - the type of code (unipolar - 'unipol' (khong doi cuc, ko co phan am) or polar - 'pol')
Tb = 1/R; % bit period
Nb = length(d); % number of bits
Timewindow = Nb*Tb; % time window
ts = Timewindow/(Ns-1); % sampling time
t = 0:ts:Timewindow; % time vector
y = zeros(size(t));
code = [];
if nargin <=3
    type = 'unipol';
end
for k = 1:Ns
    n = fix(t(k)/Tb)+1;
    if n >= Nb
        n = Nb;
    end
    switch (type)
        case 'unipol'
            y(k) = d(n);
            code(n) = d(n);
        case 'pol'
            y(k) = 2*d(n)-1;
            code(n) = 2*d(n)-1;
    end
end
end