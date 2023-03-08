a = 6; b = 8; c = 12;
A = [a-c -b; c-a 2*b; a-3*c c];
B = [10; 5; 2];
[hang, cot] = size(A);
if size(B) ~= hang
    error('Kich thuoc A va B khong bang nhau')
end
if hang == cot
    x = A^-1 * B;
elseif hang<cot
    x = pinv(A) * B;
else
    x = pinv(A) * B;
end
disp('Nghiem cua pttt la');
disp(x);
