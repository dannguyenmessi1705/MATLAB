a = input('Nhap gia tri dau a = ');
b = input('Nhap gia tri cuoi b = ');
% f: hàm so can giai
f = @(x) (x.^3)/3 + 4*x.^2 + x - 6;
% a, b: ?oan chia nghiem
% epsilon: ?o chinh xác mong muon
epsilon = 0.000001;
 
fa = f(a);
fb = f(b);
% Vi nghiem o khoang giua, lam cho f(mid) = 0 => 2 khoang a, b o bien trai va phai se
% lam cho f(a) * f(b) luon nho hon 0
if fa*fb > 0
    disp('Phuong trinh vo nghiem');
else
while b - a > epsilon*b
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
    % Ng?oc lai, nam trong khoang nghiem trong khoang [a,c]
    else
        b = c;
        fb = fc;
    end
end
x = c;
end
disp(x);