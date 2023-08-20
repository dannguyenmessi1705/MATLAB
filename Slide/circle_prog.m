function [s, p] = circle_prog(R)
xo = 1;
yo = 1;
Phi = linspace(0, 2*pi);
x = xo + R * cos(Phi);
y = yo + R * sin(Phi);
plot(x, y, 'rp-');
axis equal;
s = pi*R.^2;
s = sprintf('%.5f',s);
p = 2*pi*R;
p = sprintf('%.5f',p);
