%Giai phuong trinh vi phan sau theo pp euler va euler bien ðoi
%trên ðoan [0, max(a,b)]
dy = @(x, y) a*x^2 - b*y; 
a = 6;
b = 8;
left = 0;
right = max(a, b);
% h = 0.0a
h = 0.06;
N = (right-left)/h;

x(1) = left;

y_euler(1) =  1; %y[0] = 1;
y_euler_bien_doi(1) = 1;

% Phuong phap Euler
for i=1:N
    y_euler(i+1) = y_euler(i) + h*dy(x(i), y_euler(i));
    x(i+1) = x(i) + h;
end

% Phuong phap Euler bien doi
for i=1:N
    F = dy(x(i), y_euler_bien_doi(i));
    G = dy(x(i) + h/2, y_euler_bien_doi(i) + (h/2) * F);
    H = dy(x(i) + h/2, y_euler_bien_doi(i) + (h/2) * G);
    K = dy(x(i) + h, y_euler_bien_doi(i) +h * H);
    y_euler_bien_doi(i+1) = y_euler_bien_doi(i) + (h/6)*(F + 2*G + 2*H + K);
end

plot(x, y_euler, 'g', x, y_euler_bien_doi, 'r');
title('Giai PTVP bac 1 bang pp Euler va Euler bien doi');
xlabel('x');
ylabel('y');
legend('Euler', 'Euler bien doi');
grid on;




