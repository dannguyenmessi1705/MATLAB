%bai 19
function [chuvi ,dientich]=cricle_prog(r)
chuvi =  2.* pi .*r;
dientich = pi.* r .*r ;
syms u v
x= r * sin(u) *cos(v);
y= r*sin(u)*sin(v);
z= r* cos(u);
fsurf (x,y,z)
axis equal
title('hinh cau')
end 
