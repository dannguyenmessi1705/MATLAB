f = @(y,t) a*(y.^b);
a = 3.2;
b= 1.017;
t = 0:0.25:2;
h = 0.25;
y(1) = 1;
for i=2:length(t)
    y(i) = y(i-1)+f(y(i-1), t(i-1))*h;
end
plot(t,y);
disp(y(1:5));