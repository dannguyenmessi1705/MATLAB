a = 6;
b = 8;
A = eye(a);
cot = randi(100);
Brow = b*ones(a, randi(25));
RESULTsameRows = cat(2, A, Brow);
Bcol = b*ones(randi(25), a);
RESULTsamCol = cat(1, A, Bcol);