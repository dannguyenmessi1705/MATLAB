%Bai 4
clc;
clear all;

%Khoi tao tham so 
a = 4;
b = 3;
h = 0.01; 
t = 0:h:1; 
y = zeros(size(t)); 

%Gia tri ban dau
y(1) = 0;

% Phuong trinh vi phan
f = @(t, y) 2*a*t^2 + t - 6*b*y;

% Phuong phap Euler 
for i = 1:length(t)-1
    y(i+1) = y(i) + h*f(t(i), y(i));
end

% Ve do thi ket qua
figure(1);
plot(t, y)
xlabel('t')
ylabel('y')
title('Do thi cua phuong trinh vi phan')

% Ve do thi nguyen ham
figure(2);
plot(t,y);
axis ([0.4 0.8 0 0.5]);
xlabel('t')
ylabel('Nguyen ham trong [a,b]')
title('Do thi nguyen ham cua phuong trinh vi phan')
