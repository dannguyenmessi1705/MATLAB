clc;
color = struct('red', [], 'blue', [], 'green', []);
myStruct = struct('field', repmat(color,1,20));
for i=1:20
    myStruct.field(i).red = 'yes';
    myStruct.field(i).blue = 'no';
    myStruct.field(i).green = [0, 256, 0];
end