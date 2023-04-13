clear all; clc;
bin = randi([0 1], 1, 128);
bin2 = reshape(bin, [], 4);
dec = bi2de(bin2, 'left-msb');