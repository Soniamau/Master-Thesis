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
cnotgbE=CNOT1E*CNOT2*ghz2bE; %2 GHZ(4) entangled to bell pair
ghz2b=Tensor(ghz,ghz,bell);
cnotgb=CNOT1*CNOT2*ghz2b; 

ghzX4=Tensor(cnotgbE,cnotgb);
x=find(ghzX4); %Find all non zero entries
A=de2bi(x-1); %dim=64x20
A=fliplr(A);%Just reorganizing columns. Columns now correspond to qubits {1,16}, rows are the states
A(:,[9:18])=A(:,[11:18 9 10]);
%20 qubits-->4+4+2+4+4+2-->4+4+4+4+2+2


for i=1:1:64
    
  %bucle para BMI(2,8)
      if A(i,2)==0 && A(i,8)==0 
        H=[H;' (phi+/-)'];
    elseif  A(i,2)==1 && A(i,8)==0 
       H=[H;' (psi+/-)'];
    elseif  A(i,2)==0 && A(i,8)==1 
       H=[H;' (psi+/-)'];
        elseif  A(i,2)==1 && A(i,8)==1 
        H=[H;' (phi+/-)'];
      end
 %bucle para BMII(6,12)
      if A(i,6)==0 && A(i,12)==0 
        J=[J;' (phi+/-)'];
    elseif  A(i,6)==1 && A(i,12)==0 
       J=[J;' (psi+/-)'];
    elseif  A(i,6)==0 && A(i,12)==1 
       J=[J;' (psi+/-)'];
        elseif  A(i,6)==1 && A(i,12)==1 
        J=[J;' (phi+/-)'];
      end
     %bucle para BMIII(10,16)
      if A(i,10)==0 && A(i,16)==0 
        K=[K;' (phi+/-)'];
    elseif  A(i,10)==1 && A(i,16)==0 
       K=[K;' (psi+/-)'];
    elseif  A(i,10)==0 && A(i,16)==1 
       K=[K;' (psi+/-)'];
        elseif  A(i,10)==1 && A(i,16)==1 
        K=[K;' (phi+/-)'];
      end 
      %bucle para BMIV(4,14)
      if A(i,4)==0 && A(i,14)==0 
        L=[L;' (phi+/-)'];
    elseif  A(i,4)==1 && A(i,14)==0 
       L=[L;' (psi+/-)'];
    elseif  A(i,4)==0 && A(i,14)==1 
       L=[L;' (psi+/-)'];
        elseif  A(i,4)==1 && A(i,14)==1 
        L=[L;' (phi+/-)'];
      end 
      %bucle para BMV(3,11)
      if A(i,3)==0 && A(i,11)==0 
        M=[M;' (phi+/-)'];
    elseif  A(i,3)==1 && A(i,11)==0 
       M=[M;' (psi+/-)'];
    elseif  A(i,3)==0 && A(i,11)==1 
       M=[M;' (psi+/-)'];
        elseif  A(i,3)==1 && A(i,11)==1 
        M=[M;' (phi+/-)'];
      end 
      %bucle para BMVI(7,15)
      if A(i,7)==0 && A(i,15)==0 
        N=[N;' (phi+/-)'];
    elseif  A(i,7)==1 && A(i,15)==0 
       N=[N;' (psi+/-)'];
    elseif  A(i,7)==0 && A(i,15)==1 
       N=[N;' (psi+/-)'];
        elseif  A(i,7)==1 && A(i,15)==1 
        N=[N;' (phi+/-)'];
      end 
end 

Q=A(:,[1 5 9 13])
C=[H,J,K,L,M,N]
B=A(:,[17 18 19 20])