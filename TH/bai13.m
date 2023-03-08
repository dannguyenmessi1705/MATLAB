function x = bai13(A, B)
[hang, cot] = size(A);
if size(B) ~= hang
    error('Kich thuoc A va B khong bang nhau')
end
if hang == cot
    x = A^-1 * B;
elseif hang<cot
    x = prinv(A) * B;
else
    x = prinv(A) * B;
end
end
clear all, clc;
a = 6, b = 8, c = 12;
A = [a-c -b; c-a 2*b; a-3*c c];
B = [10; 5; 2];
x = pttt(A, B);