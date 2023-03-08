A = randi([-10 10], 6, 8);
a=6;
b=8;
while(b>a)
    A(:,b-1) = [];
    b=b-1;
end
TMP = eye(a);
B = A.*TMP;
