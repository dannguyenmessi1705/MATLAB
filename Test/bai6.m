f = @(y,t) 2*sin(t) - 5*cos(y);
t = 0:0.25:2;
h = 0.25;
y(1) = 2/3;
for i=2:length(t)
    y(i) = y(i-1)+f(y(i-1), t(i-1))*h;
end
plot(t,y);
disp(y(1:5));