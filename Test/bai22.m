A = [2 3 -8.3; -3.1 0 1; 1 -3.5 1.2];
B = [2.9; 10; 4];
Ai = [];
result = [];

if det(A) == 0
    disp('Phuong trinh vo nghiem hoac vo so nghiem');
else
    for i=1:size(A, 2)
        Ai = A;
        Ai(:, i) = B;
        result(i) = det(Ai)/det(A);
    end
end
disp(result');