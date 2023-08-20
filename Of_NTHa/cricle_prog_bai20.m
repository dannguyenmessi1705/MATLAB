%bai 20
function [chuvi ,dientich]=cricle_prog_bai20(r)
chuvi =  sprintf('%0.5f', 2*pi*r);
dientich = sprintf('%0.5f',pi * r *r);
syms u v
x= r * sin(u) *cos(v);
y= r*sin(u)*sin(v);
z= r* cos(u);
fsurf (x,y,z)
axis equal
title('hinh cau')
end 
