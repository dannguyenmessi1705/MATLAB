function nmax = bai19(N)
% 1^2 + 2^2 + ... + n^2 < N*100
% => VT = n(n+1)(2n+1)/6
% => n(n+1)(2n+1) < N*600
% nmin = 0, nmax = N
f = @(x) x*(x+1)*(2*x+1);
nmin = 0;
nmax = N*100;
% Tim kiem nhi phan
while nmin <= nmax
    mid = nmin + fix((nmax-nmin)/2);
    tmp = f(mid);
    if tmp<N*600
        nmin = mid+1;
    else
        nmax = mid-1;
    end
end

