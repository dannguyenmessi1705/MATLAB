function [b,d] = DangLuongcuc(n,Tb)
b=[];
d=[];
t=Tb:Tb:n*Tb;
for i=1:n
       b(i)=randi([0,1]);
       d(i)=1-2*b(i);
        
end
subplot(2,1,1);
stairs(t,b,'r', 'linewidth',2);
axis([Tb-1 n*Tb+1 -2 2]);
subplot(2,1,2);
stairs(t,d,'r', 'linewidth',2);
axis([Tb-1 n*Tb+1 -2 2]);


