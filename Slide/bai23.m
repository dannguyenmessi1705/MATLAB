function y = bai23()
x = input('Nhap gia tri can tinh can bac 2: ');
epsilon = 0.0001;
dx = inf;

while abs(dx) > epsilon
    x_new = (x^2+2)/(2*x);
    dx = x_new - x;
    x= x_new;
end
y = x;