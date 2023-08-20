function newInfo = binaryToAudio(bitArray, fs, n, title, artist)
% Chuyen doi chuoi bit nhi phan thanh day so nguyen kieu unit 16
samples = bi2de(reshape(bitArray, 16, [])', 'left-msb');
% Chuyen nguoc day so nguyen thanh gia tri am thanh 
% co dang nhu mang du lieu ban dau khi doc file am thanh
samples = (samples/(2^15-1))*2-1;
% Tra ve kich thuoc ban dau cua mang du lieu samples 
samples = reshape(samples, [], n);
% Ghi du lieu am thanh vao file moi voi cac thong so tu file goc
audiowrite('newfile.wav', samples, fs, 'Title', title, 'Artist', artist);
% Kiem tra thong so cua file am thanh moi so voi file goc
newInfo = audioinfo('newfile.wav');
