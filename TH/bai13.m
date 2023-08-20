a = 6; b = 8; c = 12;
A = [a -b -c; c 2*b -a;a c -3*c];
B = [10; 5; 2];
[col, row] = size(A);
A1 = A;
A1(:,1)=B;
A2 = A;
A2(:,2)=B;
A3 = A;
A3(:,3) = B;
if det(A) == 0
    disp('Phuong trinh vo nghiem hoac vo so nghiem');
else
    x1 = det(A1)/det(A);
    x2 = det(A2)/det(A);
    x3 = det(A3)/det(A);
end
disp('Nghiem cua phuong trinh la');
disp([x1; x2; x3]);