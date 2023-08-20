function [b] = BitInit(n)
for i=1:n
    b(i)=randi([0 1]);
end
end

