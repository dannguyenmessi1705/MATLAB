clc; 
clear all;
fx = @(t, y) 1-y^2;
t(1) = 0;
t0 = 0;
tf = 2;
h = 0.25;
t = 0:0.25:2;
y(1)= 0;
for i=2:length(t)
    y(i) = y(i-1)+ fx(t(i-1),y(i-1))*h;
end
plot(t, y);
disp(y(1:5));