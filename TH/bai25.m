function x = bai25(a, b)
% f: hàm so can giai
f = @(x) x^2 - 10;
% a, b: ðoan chia nghiem
% epsilon: ðo chinh xác mong muon
epsilon = 0.000001;
fa = f(a);
fb = f(b);
while abs(b-a) > epsilon
    % Tim gia tri trung binh cua khoang [a, b]
    c = (a + b)/2;
    fc = f(c);
    % Neu fc = 0, c chinh la nghiem
    if fc == 0
        x = c;
        return;
    end
    % Neu f(a)*f(c) > 0, nghiem nam trong khoang [c,b]
    if sign(fc) == sign(fa)
        a = c;
        fa = fc;
    % Ngýoc lai, nam trong khoang nghiem trong khoang [a,c]
    else
        b = c;
        fb = fc;
    end
end
if fc <= epsilon
    x=c;
    disp(x);
else
    disp('Vo nghiem');
end
