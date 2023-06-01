%% Chuong trinh vi du ve giai he phuong trinh
% [A]*[X]=[B]
a = 6; b = 8; c = 12;
A = [a -b -c; c 2*b -a;a c -3*c];
B = [10; 5; 2]; 
[row, col] = size(A); % Lay chi so hang va cot cua A
tmp = []; % Khai bao 1 vecto tam thoi rong
result = []; % Khai bao vector ket qua
if det(A) == 0 % Neu dinh thuc cua MT A = 0
    disp('Phuong trinh vo nghiem hoac vo so nghiem');
else 
    for i=1:col
        tmp = A; % Cho ma tran rong = ma tran A
        tmp(:,i) = B; % Thay cot thu i cua ma tran tmp = B
        result(i) = det(tmp)/det(A); % Luu nghiem thu i vao ma tran result
    end
end
disp('Nghiem cua phuong trinh la');
disp(result);