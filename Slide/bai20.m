xo = 1;
yo = 1;
R = 3;
Phi = linspace(0, 2*pi);
x = xo + R * cos(Phi);
y = yo + R * sin(Phi);
plot(x, y, 'b');
axis equal;
s = pi*R.^2;
p = 2*pi*R;
s = sprintf('%.5f',s);
disp(s);
p = sprintf('%.5f',p);
disp(p);