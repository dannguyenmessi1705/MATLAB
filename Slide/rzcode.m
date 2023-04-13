function [t,y] = rzcode(x, R)
% x: Chuoi bit dau vao
% R: Toc do bit
T = 1/R; % Chu ky bit
t = 0:T/1000:T-T/1000; % Thoi gian lay mau
y = []; %Khoi tao xung dau ra
for i=1:length(x)
    if x(i) == 0
        y = [y zeros(1, length(t))]; % Chu ky song RZ co gia tri bang 0
    else
        y = [y ones(1, length(t)/2) zeros(1, length(t)/2)]; % Chu ky song RZ co gia tri bang 1
    end
end
plot(0:T/1000:length(y)*T/1000 - T/1000, y); % Tao vecto t = vecto y