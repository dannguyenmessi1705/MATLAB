a = input('Nhap gia tri dau a = ');
b = input('Nhap gia tri cuoi b = ');
c = (a+b)/2;
fa = (a.^3)/3 + 4*a.^2 + a - 6;
fb = (b.^3)/3 + 4*b.^2 + b - 6;
fc = (c.^3)/3 + 4*c.^2 + c - 6;
epsilon = 1e-6;
while abs(fc) > epsilon
    if fa * fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
    c = (a+b)/2;
    fc = (c.^3)/3 + 4*c.^2 + c - 6;
end
fprintf('Nghiem cua phuong trinh la: %f\n',c); 