function  bai23(x)
    % Chon gia tri ban dau
    x0=input('x0=');
    % Tinh toan voi cong thuc lap
    while abs(x0^2 - x) > 0.0001 % kiem tra do chinh xac mong muon
        x0 = x0 - (x0^2 - x)/(2*x0);
    end
     disp('ket qua bai toan la:');
    xn= sprintf('%0.10f',x0)
end
