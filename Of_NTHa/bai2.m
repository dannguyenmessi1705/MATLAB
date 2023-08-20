%bai 2:
clc;
clear all;
M=[1 0 0; 0 j 1; j j+1 -3];
V=[ M M; M M ]
V(2,:)=[];
V(:,3)=[]
z= V(4,:)
V(4,2)= j+5