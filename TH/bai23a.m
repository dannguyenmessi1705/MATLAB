A = [1 0 0; -6 10 -3; 0 -1 51];
B = [5; 0; 0];
Ai = [];
result = [];
if det(A) == 0
    disp('PT vo nghiem hoac vo so nghiem');
else
    for i=1:size(A,2)
        Ai = A;
        Ai(:,i) = B;
        result(i) = det(Ai)/det(A);
    end
end
disp(result');