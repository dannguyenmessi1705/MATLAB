x = -2*pi:pi/50:2*pi;
y1 = sin(x);
y2 = cos(x);
h1 = plot(x, y1, 'r--');
grid on;
hold on;
h2 = plot(x, y2, 'g--');
hold off;
whitebg('black');
title('Do thi y = sin(x) va y = cos(x)');
ylabel('y = f(x)');
xlabel('x');
ax = gca;
ax.FontSize = 15;
hold on;
xhalf = -2*pi:pi/2:2*pi;
yhalf = sin(xhalf);
stem(xhalf, yhalf, 'rp','MarkerFaceColor','red','MarkerEdgeColor','yellow');
yhalf = cos(xhalf);
stem(xhalf, yhalf, 'gp', 'MarkerFaceColor','green', 'MarkerEdgeColor','white');
legend('sin(x)','cos(x)', 'Location', 'southwest');
