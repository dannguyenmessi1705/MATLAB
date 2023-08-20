%Giai phuong trinh vi phan sau theo pp euler va euler bien ðoi
%trên ðoan [0, max(a,b)]
function [x_euler, y_euler, x_euler_bien_doi, y_euler_bien_doi] = bai26_euler(a, b, dy) 
a = 8;
b = 6;
dy = @(x, y) a*x^2 - b*y; 
left = 0;
right = max(a, b);
% h = 0.0a
h = 0.08;
N = (right-left)/h;

x_euler(1) = left;
x_euler_bien_doi(1) = left;

y_euler(1) =  1; %y[0] = 1;
y_euler_bien_doi(1) = 1;

%% Phuong phap Euler
for i=1:N
    y_euler(i+1) = y_euler(i) + h*dy(x_euler(i), y_euler(i));
    x_euler(i+1) = x_euler(i) + h;
end

%% Phuong phap Euler bien doi
for i=1:N
    y1 = y_euler_bien_doi(i) + h*dy(x_euler_bien_doi(i), y_euler_bien_doi(i));
    x1 = x_euler_bien_doi(i) + h;
    loopcount=0;
    diff = 1;
    while abs(diff) > 0.05
        loopcount = loopcount + 1;
        y2 = y_euler_bien_doi(i) + h*(dy(x_euler_bien_doi(i),y_euler_bien_doi(i)) + dy(x1,y1)/2);
        diff = y1 - y2;
        y1 = y2;
    end
        % thu duoc cac cap gia tri cho dau ra
        y_euler_bien_doi(i+1) = y1;
        x_euler_bien_doi(i+1) = x1;
end
    
%% Ve do thi
plot(x_euler, y_euler, 'g', x_euler_bien_doi, y_euler_bien_doi, 'r');
title('Giai PTVP bac 1 bang pp Euler va Euler bien doi');
xlabel('x');
ylabel('y');
legend('Euler', 'Euler bien doi');
grid on;
