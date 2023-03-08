function I = bai22(f, a, b, N)
%Dung midpoint
f = @(x) 4*x.^3*2*exp(x)*cos(x); %Ham can tinh tich phan
a = -1.5; %Gioi han duoi
b = 1.5; %Gioi han tren
N = 100; %So doan con chia doan tich phan
dx = (b-a)/N; % Do dai cua moi doan con
I = 0; %Khoi tao gia tri tich phan ban dau
for i=1:N
    x_mid = a + (i-0.5) * dx; % diem giua cua doan con
    I = I + f(x_mid) * dx; % tinh gia tri tich phan
end
end
