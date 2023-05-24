
x = 0: 0.1 : 2*pi;
z = cos(x);
y = -sin(x);
b1=bitInit(length(x));
b2=bitInit(length(x));
s = b1.*y + b2.*z;
t = cos(x + pi/4);
subplot(3,1,1);
plot(x,y);
subplot(3,1,2);
plot(x,z);
subplot(3,1,3);
plot(x,s);
