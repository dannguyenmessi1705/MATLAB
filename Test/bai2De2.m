fx = @(x) 3*x^4 - 7*x^2 - 2*x +2;
a = -1;
b = 2;
c = (a+b)/2;
epsilon = 0.0005
fa = fx(a);
fb = fx(b);
fc = fx(c);
while abs(fc) > epsilon
    if fa * fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
    c = (a+b)/2;
    fc = fx(c);
end
fprintf('Nghiem cua pt la: %f\n', c);