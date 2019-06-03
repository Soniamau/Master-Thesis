clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\QETLAB-0.9'))
a=[1;0];
b=[0;1];
H=[];
J=[];
K=[];
ghz=Tensor(a,a,a)+Tensor(b,b,b);
ghzX3=Tensor(ghz,ghz,ghz);
x=find(ghzX3); %Find all non zero entries
A=de2bi(x-1); %8x9 matrix with the corresponding binary numbers
A=fliplr(A);%Just reorganizing columns. Columns now correspond to qubits {1,9}, rows are the states

%BM on qubits(columns) (2,6)(3,8)(5,9)
for i=1:1:8 
    %bucle para BMI
      if A(i,2)==0 && A(i,6)==0 
        H=[H;' (phi+/-)'];
    elseif  A(i,2)==1 && A(i,6)==0 
       H=[H;' (psi+/-)'];
    elseif  A(i,2)==0 && A(i,6)==1 
       H=[H;' (psi+/-)'];
        elseif  A(i,2)==1 && A(i,6)==1 
        H=[H;' (phi+/-)'];
      end
 %bucle para BMII
      if A(i,3)==0 && A(i,8)==0 
        J=[J;' (phi+/-)'];
    elseif  A(i,3)==1 && A(i,8)==0 
       J=[J;' (psi+/-)'];
    elseif  A(i,3)==0 && A(i,8)==1 
       J=[J;' (psi+/-)'];
        elseif  A(i,3)==1 && A(i,8)==1 
        J=[J;' (phi+/-)'];
      end
     %bucle para BMIII
      if A(i,5)==0 && A(i,9)==0 
        K=[K;' (phi+/-)'];
    elseif  A(i,5)==1 && A(i,9)==0 
       K=[K;' (psi+/-)'];
    elseif  A(i,5)==0 && A(i,9)==1 
       K=[K;' (psi+/-)'];
        elseif  A(i,5)==1 && A(i,9)==1 
        K=[K;' (phi+/-)'];
      end 
end 
B=A(:,[1 4 7])
C=[H,J,K]