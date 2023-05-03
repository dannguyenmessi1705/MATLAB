%% ----------------Nguyen Di Dan - B20DCVT086 (2-DPSK N= 6MB/s) ------------------------------------------------------------
clear,clc,close all
M = 2;      % So muc dieu che
Es =10;      % Nang luong cho mot ky hieu
Rb=6e6;   % Toc do bit- bit rate
Nsym=Rb/log2(M);   % Toc do ki hieu- Symbol rate
Tsym=1/Nsym;% Chu k? kí hieu
n = 1e4;   % So bit dau vao
phi=0;      % Pha tin hieu phat
fs=3e5;  % Tan so lay mau
fc=1e4;    % Tan so song mang
ts=1/fs; % Chu ky lay mau
bf = 7e6; % Bang thong bo loc
 
%% 1. Nhap tin hieu phat
bit = randi([0 1], 1, n); %  Chuoi bit dau vao ngau nhien
dec = bi2de(reshape(bit,log2(M),length(bit)/log2(M)).','left-msb'); % Chuyen doi nhi phan sang thap phan.
d = dpskmod(dec,M);     % Dieu che 2-DPSK
 
%% 2. Xay dung ham s(t)
t=0:ts:n/log2(M)*Tsym;
for i = 1:length(t)
    s(i) = 0;
    for k = 1:n/log2(M)
        pt(k) = sqrt((2*Es)/Tsym)*((1-cos(2*pi*t(i)))/Tsym);   
        s(i) = s(i)+ d(k)*pt(k);
    end
end
 
 
%% 3. Do thi tin hieu bang goc
plot(t,s);
xlabel(' Thoi gian (s)'); ylabel( ' Bien do ');
title(' Do thi tin hieu goc ');
 
signalA=s.*exp(1i*phi); %tin hieu sau dieu che 
signalE=signalA.*exp(1i*2*pi*fc*t);    %Tin hieu de xac dinh mau mat
 
%% 4. Do thi va pho cua tin hieu sau dieu che 2-DPSK
figure
subplot(2,1,1);
plot(t,real(signalE))
xlabel(' Thoi gian (s)'); ylabel( ' Bien do ');
title('Do thi tin hieu sau dieu che');
subplot(212);
spectrum(signalE,fs);
title('Pho cua tin hieu sau dieu che');
 
%% 5. Mau mat cua tin hieu sau khi dieu che 2-DPSK
eyediagram(real(signalE),20);
title(' Bieu do mat tin hieu 2-DPSK');
 
%% 6. Chom sao cua tin hieu sau khi dieu che
scatterplot(d,1,0,'or');
title(' Bieu do chom sao cua tin hieu sau dieu che ' );
 
%% 7. Do thi va pho cua tin hieu sau khi qua AWGN 
figure
signal_noise=addNoiseAWGN(signalE,5);
subplot(211);
plot(t, real(signal_noise));
xlabel(' time s'); ylabel( ' Bien do ');
title(' Do thi khi bi AWGN ');
subplot(212);
spectrum(signal_noise,fs);
title('Pho cua tin hieu bi AWGN');
 
%% 8. Mau mat cua tin hieu sau khi qua kenh AWGN
eyediagram(real(signal_noise),20);
title('Bieu do mat tin hieu 2-DPSK khi qua AWGN');
 
%% 9. Chom sao cua tin hieu sau khi qua kenh AWGN va so sanh voi chom sao goc
d_noise = addNoiseAWGN(d,5);
h = scatterplot(d_noise,1,0,'x');
hold on;
scatterplot(d,1,0,'or',h);
title('Bieu do chom sao cua tin hieu sau khi qua kenh AWGN');
 
 
 
%% 10. Xu ly va khoi phuc tai bo thu
figure
source1 = signal_noise.*exp(-1i*phi).*exp(-1i*2*pi*fc*t);     %Tin hieu thu truoc bo loc
source = raisedCosFilter(source1,bf,ts,2);  % Khoi phuc lai tin hieu 
plot(t,real(source))    % Do thi tin hieu sau khi khoi phuc va pho cua no
xlabel('Thoi gian(s)'); ylabel('Bien do');
title('Do thi tin hieu khoi phuc');
figure
spectrum(source,fs);
title('Pho cua tin hieu duoc khoi phuc');
 
%% 11. Chom sao tin hieu duoc khoi phuc
h = scatterplot(source,1,0,'xb');
title('Bieu do chom sao cua tin hieu duoc khoi phuc');
 
%% 12. Mau mat tin hieu sau khi khoi phuc
eyediagram(real(source),20);
title('Mau mat duoc khoi phuc');
 
 
%% 13. Tinh BER bang phuong phap Monte-Carlo
 
SNR_dB=[2 5 10] ;
%======vong lap=====%
for i=1:length(SNR_dB)
    SNR=exp(SNR_dB(i)*log(10)/10);   %Chuyen dB sang so lan
    theoryBer(i)=2*qfunc(sqrt(SNR)); %Tinh BER theo ly thuyet
    simBer(i)=monteCarlo(SNR_dB(i), n, bit);  %Tinh BER theo thuc nghiem
   
end

% Uoc tinh xac suat loi tai BER = [ 2 5 10 ]
disp('Ket qua BER tai SNR lan luot la 2 5 va 10dB la')
simBer = single(simBer)   %Lam tron 5 so.
%Do thi
semilogy(SNR_dB,theoryBer,'LineWidth',2);hold on;
semilogy(SNR_dB,simBer,'r-*','LineWidth',2);grid on;
xlabel('SNR (dB)'); ylabel('BER'); 
title(' Truyen tin hieu DPSK qua kenh AWGN');
legend('BER_l_y_ _t_h_u_y_e_t','BER_m_o_ _p_h_o_n_g'); 


%% ================== FUNCTION ======================

%% ======= Ham them kenh nhieu AWGN =============== %%
function yNoise = addNoiseAWGN(y,SNR_dB)
% y - Tin hieu dau vào
% SNRdB - Muc SNR dB
% yNoise – Tin hieu nhieu dau ra
SNR = 10^(SNR_dB/10);
VarN = abs(var(y))/SNR;
if (isreal(y))
    yNoise = y + sqrt(VarN)*randn(size(y));
else
    yNoise = y + sqrt(VarN/2)*(randn(size(y))+1i*randn(size(y)));
end
end


%% ==== Ham them kenh nhieu Gauss ============== %%
function yNoise = addNoiseGauss(y, SNR_dB)
% y - Tin hieu dau vao
% SNR_db - Ty le tin hieu nhieu dB
% yNoise - Tin hieu dau ra qua nhieu
        SNR_lin = 10^(SNR_dB/10);
        noise = randn(size(y));
        power_signal = mean(abs(y).^2);
        power_noise = power_signal/SNR_lin;
        noise = noise*sqrt(power_noise);
        yNoise = y + noise;
end

%% ==== Ham xu ly bo loc (Dung bo loc Raised Cosine ======= %%
function y = raisedCosFilter(x,bf,Ts,beta)
% x - dau vao
% bf - bang thong cua bo loc
% Ts - chu ky lay mau
% beta - he so giam doc (rolloff factor)
% y - dau ra bo loc
Ns = length(x);
Tb = 1/bf;
beta = beta*bf;
% Mien tan so
f = [0:Ns/2-1 -Ns/2:-1]/(Ns*Ts);
Xf = fft(x);
Yf = zeros(size(Xf));
ind = (abs(f) <= (bf/2-beta));
Yf(ind) = Xf(ind).*Tb;
ind = (abs(f) <= (bf/2+beta) & abs(f) > (bf/2-beta));
Yf(ind) = Xf(ind).*(Tb*cos(pi/(4*beta)*(abs(f(ind))-bf/2+beta)).^2);
ind = (abs(f) > (bf/2+beta));
Yf(ind) = Xf(ind).*0;
% Chuyen doi sang mien thoi gian
y = ifft(Yf)./Tb;
end

%% ===== Ham tinh BER bang Monte Carlo =================== %%
function berMonteCarlo = monteCarlo(SNR_dB, n, bit)
    % SNR_dB: Ty le tin hieu nhieu
    % n: So lan lap danh gia hieu nang
    % berMonteCarlo: BER trung binh dua tren ky thuat Monte Carlo
    M = 2; % 2-DPSK
    % BER trung binh
    berSum = 0;
    for i = 1:n
        % Tin hieu dieu che
        bitmodulated = dpskmod(bit, M);
        % Tao ra tin hieu qua nhieu Gauss
        signal_noise = addNoiseGauss(bitmodulated, SNR_dB);
        % Giai dieu che tin hieu
        bitdemodulated = dpskdemod(signal_noise, M);
        % Tinh so luong bit sai khac giua bit ban dau va bit sau giai dieu che
        num_errors = sum(bit ~= bitdemodulated);
        % Tinh loi bit
        berSum = berSum + num_errors/n;
    end
    berMonteCarlo = berSum/n;
end


%% ========= Ham ve pho tin hieu ======================== %%
function st_fft_fre = spectrum(x,fs)
    % pho cua tin hieu x
    % fs - tan so lay mau
    st_fft = fft(x);
    st_fft = fftshift(st_fft); 
    st_fft_fre = fs/2*linspace(-1, 1, length(st_fft));
    plot(st_fft_fre, abs(st_fft));
    grid;
    xlabel('Tan so (Hz)');
    ylabel('Bien do');
end
