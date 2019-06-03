clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\QETLAB-0.9'))
a=[1;0];
b=[0;1];

I=eye(2);
X=[0 1;1 0];
Y=[0 1;1 0]; %iY
Z=[1 0;0 -1];

ghz0000=Tensor(a,a,a,a)+Tensor(b,b,b,b);
ghz0001=Tensor(I,I,I,X)*ghz0000;
ghz0010=Tensor(I,I,I,Z)*ghz0000;
ghz0011=Tensor(I,I,I,Y)*ghz0000;

ghz0100=Tensor(I,I,X,I)*ghz0000;
ghz0101=Tensor(I,I,X,X)*ghz0000;
ghz0110=Tensor(I,I,X,Z)*ghz0000;
ghz0111=Tensor(I,I,X,Y)*ghz0000;

ghz1000=Tensor(I,X,I,I)*ghz0000;
ghz1001=Tensor(I,X,I,X)*ghz0000;
ghz1010=Tensor(I,X,I,Z)*ghz0000;
ghz1011=Tensor(I,X,I,Y)*ghz0000;

ghz1100=Tensor(I,X,X,I)*ghz0000;
ghz1101=Tensor(I,X,X,X)*ghz0000;
ghz1110=Tensor(I,X,X,Z)*ghz0000;
ghz1111=Tensor(I,X,X,Y)*ghz0000;

GHZ=[ghz0000 ghz0001 ghz0010 ghz0011 ghz0100 ghz0101 ghz0110 ghz0111 ghz1000 ghz1001 ghz1010 ghz1011 ghz1100 ghz1101 ghz1110 ghz1111];
x=find(GHZ(:,9));
A=de2bi(x-1);
A=fliplr(A)
