% ??nh ngh?a c?u trúc color
color = struct('red', {}, 'blue', {}, 'green', {});
% ??nh ngh?a tr??ng 1x20 c?a các c?u trúc color
for i = 1:20
    color(i).red = 'yes';
    color(i).blue = 'no';
    color(i).green = [0, 256, 0];
end