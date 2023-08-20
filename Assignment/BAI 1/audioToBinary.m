function [samples,bitArray,fs,n,title,artist] = audioToBinary(fileName)
% Doc va luu du lieu am thanh vao mang
[samples, fs] = audioread(fileName);
% Ðoc cac thong so cua file am thanh goc
originInfo = audioinfo(fileName);
title = originInfo.Title;
artist = originInfo.Artist;
% Luu kich thuoc ma tran samples vua lay duoc tu am thanh goc
[m, n] = size(samples);
samples = reshape(samples, [], 1);
% Chuyen doi du lieu am thanh sang du lieu so 
% roi chuyen ve chuoi bit nhi phan co do dai 16 bit
bitString = dec2bin(round((samples + 1) * (2^15-1)/2), 16)';
% Vi samples co gia tri [-1,1] => samples + 1 dung de dua cac gia tri ve cac so duong
bitArray = bitString(:)' - '0'; % Chuyen chuoi bit nhi phan sang vector chua cac so 0 1