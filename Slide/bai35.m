% Bài 35
a= 0:15;        % Tao gia tri ban tin co dang thap phan
i=de2bi(a','left-msb');    % Chuyen ban tin thanh dang nhi phan co trong so tu cao den thap
g=[1 0 0 0 1 1 1;
   0 1 0 0 1 1 0;
   0 0 1 0 1 0 1;
   0 0 0 1 0 0 1];
% Nhap ma tran sinh G
c=mod((i*g),2);  % Tinh ra ma tran ma
