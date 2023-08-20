% Tinh pho cua mot ham tin hieu
function [f,Pf] = Spectrocal(t,x)
Ns=length(x); % So luong lay mau
Ts=t(2)-t(1); % Chu ky lay mau
f=(-Ns/2 : Ns/2 -1)/(Ns*Ts);
Pf=fft(x,Ns);% Bien doi Fourier
Pf=fftshift(Pf)/Ns; %Dich thanh phan tan so ve trung tam pho
Pf=abs(Pf).^2;
end

