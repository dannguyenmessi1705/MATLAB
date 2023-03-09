% A = [];
% k=1;
% sum = 0;
% for i=1:6
%     for j=1:8
%         A(i,j)=k;
%         sum=sum+k;
%         k=k+1;
%     end
% end
% tb = sum/(6*8);

% Cach 2
a = 6;
b = 8;
k = a*b;
A(1:9) = 1:9;
B = A';
SUM1 = sum(B);
TB1 = mean(B);
SUM2 = sum(SUM1');
TB = SUM2/(a*b);