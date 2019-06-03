clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\QETLAB-0.9'))
a=[1;0];
b=[0;1];

H=[];
J=[];
K=[];
L=[];
M=[];
N=[];

%ERROR IN 1
bell=Tensor(a,a)+Tensor(b,b);
ghzE=Tensor(b,a,a,a)+Tensor(a,b,b,b);
ghz=Tensor(a,a,a,a)+Tensor(b,b,b,b);

%Create matrix CNOT1 asociated to first ghz in 2 steps
I=eye(512); %STEP 1 
v=[];
for i=1:4:509 %STEP 2, create vector in the diagonal 
    v(i)=1;
    v(i+1)=1;
end
V=diag(v,2)+diag(v,-2);
CNOT1=blkdiag(I,V); %dim=1024
CNOT1E=blkdiag(V,I);  %ERROR in 1 -> interchange block diagonal

%Create matrix CNOT2 asociated to second ghz
I2=eye(32);
z=ones(1,31);
for i=1:2:30 
    z(i)=1;
    z(i+1)=0;    
end
V2=diag(z,1)+diag(z,-1);
CNOT2=blkdiag(I2,V2); %dim=64 this block is 16 times repeated
CNOT2=kron(eye(16),CNOT2);%%dim=1024

ghz2bE=Tensor(ghzE,ghz,bell);%dim=1024 --> entangle (1,9) y (5,10) 
cnotgbE=CNOT1E*CNOT2*ghz2bE ; %2 GHZ(4) entangled to bell pair
ghz2b=Tensor(ghz,ghz,bell);
cnotgb=CNOT1*CNOT2*ghz2b; 
x=find(ghz2b);
w=find(cnotgb);
y=find(ghz2bE);
Y=de2bi(y-1);
Y=fliplr(Y);
s=find(cnotgbE);
C=CNOT1*CNOT2;

