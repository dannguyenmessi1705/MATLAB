%% Thuc hien qua trinh loc tin hieu bang bo loc Butterworth co ham truyen
%% |H(f)^2| = 1/(1+(w/wb)^(2*n))
% n - bac cua bo loc
% wb - do rong bang thong bo loc
function y = Butterworth_ZD(x,n,B,Ts)
% B - bang thong bo loc, Ts - thoi gian lay mau, n - bac cua bo loc
% x - tin hieu vao bo loc, y - tin hieu sau khi qua bo loc
Ns = length(x); % Lay so luong mau
% Bien doi ve mien tan so
f = [0:Ns/2-1 -Ns/2:-1]/(Ns*Ts); % tao vecto tan so f
Xf = fft(x); % Bien doi fourier tin hieu vao x
Hf = 1./(1+(f./B).^(2*n)); % Ham truyen
Yf = Xf.*Hf;
% Chuyen nguoc lai ve mien thoi gian
y = ifft(Yf);