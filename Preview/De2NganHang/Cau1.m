A = [1 7 -3 -2.5;
     -3 2.7 1.3 1;
     0 3.1 -1 -5.7;
     4 0 -3 6];
B = [1.9 4 5 3.6];
Ai = [];
result = [];
if det(A) == 0
    disp('Vo nghiem hoac vo so nghiem');
else
    for i=1:size(A,2)
        Ai = A;
        Ai(:,i) = B;
        result(i) = det(Ai)/det(A);
    end
end
disp(result);