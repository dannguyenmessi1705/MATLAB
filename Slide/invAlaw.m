function [y] = invAlaw(x, A)
% Ham giai nen tien doan theo luat A-Law
% x: vector dau vao da bi nen theo luat A-Law
% A: he so nen theo luat A-Law
% amax: bien do cuc dai cua tin hieu dau vao
% y: vector sau khi giai nen
amax=max(abs(x));
xn = sign(x) .* ((1+A).^abs(x) - 1) ./ A; % Ap dung cong thuc giai nen Mu-Law
y = xn .* amax; % Nhan lai bien do cuc dai
end

