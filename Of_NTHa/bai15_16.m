%bai 15
x=(-2:0.2:2);
y=(-1:0.1:1)';
% v=ones(length(x),1);
% X=v*x;
% Y=y*v';
[X, Y] = meshgrid(x, y);
f=X.^2+ Y.^2;
surf(x,y,f)
title('Do thi ham x^2 +y^2');
figure
%bai16
r=3;
syms u v
x= r* sin(u) * cos (v);
y=r* sin(u) * sin(v);
z= r* cos(u);
fsurf (x,y,z)
axis equal
title ('Hinh cau co ban kinh R=3');
