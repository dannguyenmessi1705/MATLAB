function bai30(N)
if N<0
    disp('So vua nhap la so am');
    return;
else
   if N<2
       disp('So vua nhap khong phai so nguyen to');
       return;
   end
   for i=2:sqrt(N)
       if mod(N,i) == 0
           disp('So vua nhap khong phai so nguyen to');
           return;
       end
   end
   disp('So vua nhap la so nguyen to');
end
