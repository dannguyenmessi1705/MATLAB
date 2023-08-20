%% Thuc hien qua trinh loc tin hieu bang bo loc Raised Cosine
% P(f)= Tb, |f| <= Rb/2 - beta
%     = Tb*cos(pi/(4*beta)*(|f(ind)|-Rb/2+beta)).^2, Rb/2-beta<|f|<=Rb/2+beta
%     = 0, |f|>Rb/2+beta
function y = RaisedCosine_ZD(x, B, Ts, beta)
% x - tin hieu vao bo loc, Rb - Bang thong bo loc
% Ts - thoi gian lay mau, beta - he so roll-off cua bo loc
Ns = length(x); % So luong mau
Tb = 1/B; % Chu ki cua bo loc
beta = beta*B; % CT tinh roll-off cua bo loc
% Chuyen ve mien tan so
f = [0:Ns/2-1 -Ns/2:-1]/(Ns*Ts); % Tao vecto tan so f
Xf = fft(x); % Bien doi Fourier tin hieu vao x
Yf = zeros(size(Xf)); % Khoi tao vector Yf
% Dieu kien: P(f)= Tb, |f| <= Rb/2 - beta
ind = (abs(f) <= (B/2-beta)); 
Yf(ind) = Xf(ind).*Tb;
% Dieu kien P(f)= Tb*cos(pi/(4*beta)*(|f(ind)|-Rb/2+beta)).^2, Rb/2-beta<|f|<=Rb/2+beta
ind = (abs(f) > (B/2 - beta) & abs(f) <= (B/2 + beta));
Yf(ind) = Xf(ind).*(Tb*cos(pi/(4*beta) * (abs(f(ind)) - B/2+beta)).^2);
% Dieu kien P(f) = 0, |f|>Rb/2+beta
ind = (abs(f) > (B/2 + beta));
Yf(ind) = Xf(ind).*0;
% Chuyen nguoc ve mien thoi gian
y = ifft(Yf)./Tb;

