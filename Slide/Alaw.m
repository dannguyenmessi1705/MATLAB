%Bai 32
%Ham nen theo luat A
function [y,amax]= Alaw(x,A) 
% voi x la vector dau vao, A la hang so
xmax= max(abs(x));% Tim gia tri tuyet doi lon nhat cua tin hieu
if xmax <= 1/A
    amax = A*xmax/(1+log(1+A));
else
    amax = (1+log(A*xmax))/log(1+A);
y = sign(x) * log(1 + A * abs(x)/amax)/log(1+A);
end
end