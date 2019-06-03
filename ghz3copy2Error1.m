clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\QETLAB-0.9'))
a=[1;0];
b=[0;1];

ghz=Tensor(a,a,a)+Tensor(b,b,b);
ghz2=Tensor(ghz,ghz);

NOT=[0 1;1 0]; %matrices for bit flip
Y=eye(2);
C1=Tensor(NOT,Y,Y)*ghz; %error 1
C2=Tensor(Y,NOT,Y)*ghz; %error 2
C3=Tensor(Y,Y,NOT)*ghz; %error 3

E=[Tensor(C1,C1),Tensor(C2,C2),Tensor(C3,C3)];
%I want to stablish some conexion between parties (1,2,3) and (A,B,C).
%Let's start with CNOT (1,A),(2,B),(3,C)

%Create matrix CNOT1A asociated to (1,A)
I=eye(32); %STEP 1 
v=[];
for i=1:8:25 %STEP 2, create vector in the diagonal 
    v(i)=1;
    v(i+1)=1;
    v(i+2)=1;
    v(i+3)=1;
end
V=diag(v,4)+diag(v,-4);
CNOT1A=blkdiag(I,V); %dim=64

%Create matrix CNOTA1 asociated to (A,1)
w1=repmat([1 1 1 1 0 0 0 0],1,8);
u1=repmat([0 0 0 0 1 1 1 1],1,4);
CNOTA1=diag(w1)+diag(u1,32)+diag(u1,-32);%dim=64

%Create matrix CNOT2B asociated to (2,B)
I2=eye(16); %STEP 1 
z=[];
for i=1:4:13 %STEP 2, create vector in the diagonal 
    z(i)=1;
    z(i+1)=1;
end
V2=diag(z,2)+diag(z,-2);
CNOT2B=blkdiag(I2,V2); %dim=32
CNOT2B=kron(eye(2),CNOT2B);%dim=64

%Create matrix CNOTB2 asociated to (B,2)
w2=repmat([1 1 0 0],1,16);
u2=repmat([0 0 1 1],1,12);
CNOTB2=diag(w2)+diag(u2,16)+diag(u2,-16);%dim=64

%Create matrix CNOT3C asociated to (3,C)
I3=eye(8); %STEP 1 
w=ones(1,7);
for i=1:2:6 %STEP 2, create vector in the diagonal 
    w(i)=1;
    w(i+1)=0;
end
V3=diag(w,1)+diag(w,-1);
CNOT3C=blkdiag(I3,V3); %dim=16
CNOT3C=kron(eye(4),CNOT3C);%dim=64

%Create matrix CNOTC3 asociated to (C,3)
w3=repmat([1 0],1,32);
u3=repmat([0 1],1,28);
CNOTC3=diag(w3)+diag(u3,8)+diag(u3,-8);%dim=64

cnot1=CNOT1A*CNOT2B*CNOTC3;
cnot2=CNOT1A*CNOTB2*CNOT3C ;
cnot3=CNOTA1*CNOT2B*CNOT3C;
 %matrix with errors, column 1 is error in qubit 1, column 2 is error in qubit 2....


H=[];
J=[];
K=[];
L=[];
M=[];
N=[];   
 ghzE=E(:,1);
   
   ghzX6=Tensor(cnot1*ghzE,cnot2*ghz2,cnot3*ghz2);%dim=262144

x=find(ghzX6); %Find all non zero entries
A=de2bi(x-1); %dim=64x18
A=fliplr(A);%Just reorganizing columns

for i=1:1:64
 
  %bucle para BMI(2,6)->(2,9)
      if A(i,2)==0 && A(i,9)==0 
        H=[H;' (phi+/-)'];
    elseif  A(i,2)==1 && A(i,9)==0 
       H=[H;' (psi+/-)'];
    elseif  A(i,2)==0 && A(i,9)==1 
       H=[H;' (psi+/-)'];
        elseif  A(i,2)==1 && A(i,9)==1 
        H=[H;' (phi+/-)'];
      end
 %bucle para BMII(3,8)->(3,14)
      if A(i,3)==0 && A(i,14)==0 
        J=[J;' (phi+/-)'];
    elseif  A(i,3)==1 && A(i,14)==0 
       J=[J;' (psi+/-)'];
    elseif  A(i,3)==0 && A(i,14)==1 
       J=[J;' (psi+/-)'];
        elseif  A(i,3)==1 && A(i,14)==1 
        J=[J;' (phi+/-)'];
      end
     %bucle para BMIII(5,9)->(8,15)
      if A(i,8)==0 && A(i,15)==0 
        K=[K;' (phi+/-)'];
    elseif  A(i,8)==1 && A(i,15)==0 
       K=[K;' (psi+/-)'];
    elseif  A(i,8)==0 && A(i,15)==1 
       K=[K;' (psi+/-)'];
        elseif  A(i,8)==1 && A(i,15)==1 
        K=[K;' (phi+/-)'];
      end 
      %bucle para BMIV(11,15)->(5,12)
      if A(i,5)==0 && A(i,12)==0 
        L=[L;' (phi+/-)'];
    elseif  A(i,5)==1 && A(i,12)==0 
       L=[L;' (psi+/-)'];
    elseif  A(i,5)==0 && A(i,12)==1 
       L=[L;' (psi+/-)'];
        elseif  A(i,5)==1 && A(i,12)==1 
        L=[L;' (phi+/-)'];
      end 
      %bucle para BMV(12,17)->(6,17)
      if A(i,6)==0 && A(i,17)==0 
        M=[M;' (phi+/-)'];
    elseif  A(i,6)==1 && A(i,17)==0 
       M=[M;' (psi+/-)'];
    elseif  A(i,6)==0 && A(i,17)==1 
       M=[M;' (psi+/-)'];
        elseif  A(i,6)==1 && A(i,17)==1 
        M=[M;' (phi+/-)'];
      end 
      %bucle para BMVI(14,18)->(11,18)
      if A(i,11)==0 && A(i,18)==0 
        N=[N;' (phi+/-)'];
    elseif  A(i,11)==1 && A(i,18)==0 
       N=[N;' (psi+/-)'];
    elseif  A(i,11)==0 && A(i,18)==1 
       N=[N;' (psi+/-)'];
        elseif  A(i,11)==1 && A(i,18)==1 
        N=[N;' (phi+/-)'];
      end 
end 

B=A(:,[1 7 13 4 10 16]);
C=[H,J,K,L,M,N];

for j=1:1:16
O=ismember(C,C(j,:),'rows');
O=double(O); %transforms logic to double
O2=find(O); %dim=4
B2= B([O2(1) O2(2) O2(3) O2(4)],:);
B3=bi2de(fliplr(B2))+1;
zero=zeros(64,1);
for k=1:1:4
    zero(B3(k),:)=1;
end
j
result=fliplr(de2bi(find(zero)-1))
result2=CNOTA1*CNOTB2*CNOT3C*zero;
result3=fliplr(de2bi(find(result2)-1))
end 




