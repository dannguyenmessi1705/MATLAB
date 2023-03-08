A = [];
k=1;
sum = 0;
for i=1:6
    for j=1:8
        A(i,j)=k;
        sum=sum+k;
        k=k+1;
    end
end
tb = sum/(6*8);