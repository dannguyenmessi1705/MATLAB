Np = 4;
fs = 1e3;
t = 0:1/fs:Np;
ind = 1;
y = [];
for i=1:length(t)
    y(i) = 1;
    if t(i) >= (ind-1/2)
        y(i) = 0;
    end
    if t(i)>=ind
        ind = ind+1;
    end
end
plot(t,y, "linewidth", 2);

f=0:1/(max(t)-min(t)):fs;
ys1 = fft(y, length(y));
ys2 = fftshift(ys1);
figure; Q
plot(f, ys2);
