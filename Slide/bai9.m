t = (0:0.1:10);
cosre = cos(2*pi*3*t);
expre = exp(-0.1*t);
sinre = sin(2*pi*5*t);
result = sinre.*cosre+expre; % Nhan tung vi tri tham so voi nhau roi cong ham e mu
disp(result);