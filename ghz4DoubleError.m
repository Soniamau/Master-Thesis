clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\QETLAB-0.9'))
a=[1;0];
b=[0;1];
ghz=Tensor(a,a,a,a)+Tensor(b,b,b,b);
ghzX4=Tensor(ghz,ghz,ghz,ghz);
x=find(ghzX4); %Find all non zero entries
X=de2bi(x-1); %16x16 matrix with the corresponding binary numbers
X(:,[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])= X(:,[16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1]);%Just reorganizing columns. Columns now correspond to qubits {1,9}, rows are the states
 
for j=1:1:16
    display(j)
    A=X;
    A(:,j)=mod(X(:,j)+1,2); %Introducimos errores, un error a cada paso
    for w=1:1:15
    k=mod(j+w,16);
    display(k)
       if k==0 
        A(:,j+w)=mod(X(:,j+w)+1,2); 
       else
       A(:,k)=mod(X(:,k)+1,2); %Bucle para introducir un error extra respecto al anterior
       end
H=[];
J=[];
K=[];
L=[];
M=[];
N=[];
      for i=1:1:16 %Bucle para hacer todas las medidas
    
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
B=A(:,[1 5 9 13])
C=[H,J,K,L,M,N]
       if k==0 
        A(:,j+w)=X(:,j+w); 
       else
       A(:,k)=X(:,k); %Bucle para devolver la matriz al estado sin el error extra
       end
end
   
end 
