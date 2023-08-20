%bai 3
%a=4, b=3,c=9,N=14
a=input('a=');
b=input('b=');
c=input('c=');
%Ma tran ve trai
A=[a -b -c; c 2*b -a; a c -3*c];
%Kiem tra dieu kien co nghiem

%Ma tran ve phai
B=[10;5;2];
C=[];
C=A\B %Tim nghiem cua he phuong trinh

