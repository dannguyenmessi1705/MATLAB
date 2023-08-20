a = 0;
b = 2;
x = [];
f = @(x) 3*x^4-7*x^2+2*x+2;
esp = 5e-4;
fa = f(a);
fb = f(b);
while (b-a) > eps
    c = (a+b)/2;
    fc = f(c);
    if fc == 0
        x = c;
        break;
    end
    if sign(fa) == sign(fc)
        a = c;
        fa=fc;
    else
        b=c;
        fb=fc;
    end
end
if abs(fc) <= eps
    x=c;
    disp(x);
else
    disp('Vo nghiem');
end
