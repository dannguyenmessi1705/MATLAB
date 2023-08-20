al = 3;
be = 1.5;
f = @(y,t) al*y.^be + y;
t0 = 0;
tf = 2;
h = 0.25;
N = (tf-t0)/h;
t(1) = t0;
y(1)=1;
for i=1:N
    t(i+1) = t(i)+h;
    y(i+1) = y(i) + f(t(i),y(i))*h;
end
plot(t,y);