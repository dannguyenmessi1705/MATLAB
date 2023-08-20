%% Chuong trinh tao tu ma c tu ma tran sinh G va chuoi du lieu vao m
hang = randi([4, 10]);
cot = randi([4, 10]);
G = randi([0 1], hang, cot); % Tao ma tran sinh G ngau nhien bao gom cac bit 0 1
m = zeros(2^hang, hang); % Khoi tao ma tran dau vao
%% Sinh cac bit cho chuoi m (VD: 0000, 0001, 0010, 0011,...,1111)
for i=1:2^hang
    for j=hang:-1:1
        if mod(i-1, 2^(hang-j+1)) >= 2^(hang-j)
            m(i, j) = 1;
        else
            m(i, j) = 0;
        end
    end
end
%% Tao tu ma ra theo CT (c = m*G), do la phep cong XOR, nen phai %2 de xet
%% bit chan 1 => 0, bit le 1 => 1
c = mod(m*G, 2);
%% Tim khoang cach Hamming nho nhat, dmin (la so bit sai khac nho nhat giua cac hang cua ma tran c)
%% Vi hang ban dau cua ma tran c luc nao cung co gia tri [0 0 ... 0]
%% => Tim trong cac hang, hang nao co it bit 1 nhat de doi chieu voi hang ban dau => Lay sum de tim ra dmin
tmp = c(2:2^hang, :); % Bo hang dau di, vi hang dau toan bit 0 va ta dang doi chieu voi no
SUM = sum(tmp'); % Tim tong cac hang
dmin = min(SUM); % So voi hang dau tien, hang nao co sum min => do chinh la dmin