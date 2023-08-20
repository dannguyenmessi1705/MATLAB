x = (-2:0.2:2);
y = (-1:0.1:1);
% z = ones(length(x),1);
% X = z*x;
% t = ones(length(y),1);
% Y = y*t;
% Ham tao 2 ma tran X, Y thanh ma tran 2D de ve hinh 3D
[X, Y] = meshgrid(x,y); 
f = X.^2 + Y.^2;
surf(x, y, f);
