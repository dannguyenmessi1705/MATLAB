%bai 21
%vi du ve giai thuat tim nghiem dung pp chia nua
clc;
clear ;
a=-1; fa=-10/3;
b=3; fb=42;
x1= input ('x1=');
x2= input ('x2=');
x3= input ('x3=');
x4=input('x4=');
while (b-a) > eps *b
    x=(a+b)/2;
    fx=x1 *x^3 + x2*x^2+ x3*x+x4;
    if sign(fx) == sign(fa)
            a=x;fa=fx;
        else 
            b=x;
            fb=fx;
    end
end
x= sprintf('%0.10f',x)




    