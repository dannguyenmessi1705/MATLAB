%% Chuong trinh giai phuong trinh bang phuong phap chia nua bitsection
% VD: f(x) = 4x^3 − 13x^2 + 13x − 10 trong khoảng [min(a,b) max(a,b)]
% Run: x = BitSection_ZD(@(x) 4*x^3−13*x^2+13*x−10, a, b)
function x = BitSection_ZD(f, a, b)
eps = 1e-5; % Xac dinh sai so de tim nghiem
start = min(a,b); % Tim gia tri dau
finish = max(a,b); % Tim gia tri cuoi
fs = f(start);
ff = f(finish);
% Vi diem mid lam nghiem o giua a va b lam cho f(mid)=0
% => fs*ff < 0 (fs va ff phai trai dau thi mid moi lam diem cuc dai)
if sign(fs) == sign(ff)
    disp("Phuong trinh vo nghiem");
else
    while (finish - start)/finish > eps % Xet dieu kien 2 khoang van > eps => tiep tuc tim nghiem
        mid = (finish+start)/2; % Tim diem o giua 2 khoang a va b
        fm = f(mid);
        if fm == 0 % Neu diem o giua lam cho f=0 => do chinh la nghiem
            x = mid; 
            break;
        end
        % Neu fs*fm > 0 => Nghiem se ko nam trong khoang [start to mid] nua
        % => Nghiem se nam o khoang [mid to finish] va nguoc lai
        if sign(fs) == sign(fm)
            start = mid;
            fs = fm;
        else
            finish = mid;
            ff = fm;
        end
    end
    % Ket thuc vong while ta tim duoc nghiem
    x = mid;
end
sprintf('Phuong trinh co nghiem la %.5f', x);
end
