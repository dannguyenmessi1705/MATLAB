C = [1 2 3 4 10; -22 1 11 -12 4; 8 1 6 -11 5; 18 1 11 6 4];
for i=1:4
    for j=1:5
        if ((C(i,j) > 10) || (C(i,j) < -10)) % Neu phan tu trong ma tran lon hon 10 hoac nho hon -10, gan = 0
            C(i, j) = 0;
        end
    end
end
%% Cach 2
clc;
test1 = C < -10;
test2 = C > 10;
test3 = test1 | test2;
test4 = ~(test3);
C = C.*test4;
