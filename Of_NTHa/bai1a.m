%bai 1
%a=4, b=3,c=9,N=14
clc;
clear all;
a=input('a=');
b=input('b=');
c=input('c=');
A=[ a -b -c; c 2*b -a; a c -3*c]
B=[10; 5; 2]
A=[];
for i=1:7
    for j=1:7
        if(i==b+4 && j== b+4)
            A(i,j)=10;
        else 
            A(i,j)=a;
        end
    end
end
A
B=[];
for i=1:5
    for j=1:10
        B(i,j)=randi([0 1]);
    end
end
B
        
     
