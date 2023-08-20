function fibo = bai20(n)
if n<0
    error('n phai la so nguyen duong');
elseif n==1 || n==2
    fibo = 1;
else
    fibo = bai20(n-1) + bai20(n-2);
end
    