r=3;
syms u v
x= r* sin(u) * cos (v);
y=r* sin(u) * sin(v);
z= r* cos(u);
fsurf (x,y,z)
axis equal;
title ('Hinh cau co ban kinh R=3');
figure;
[X, Y, Z] = sphere(100);
mesh(X*r, Y*r, Z*r);
axis equal;
title('Hinh cau co ban kinh R=3');

