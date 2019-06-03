clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\Encuesta1.xlsx'))
O=[];
P=[];
Q=[];
A=[];
B=[];
C=[];
D=[];
E=[];
H=[];
T=[];
S=[];
L=[];
F=[];
T2=[];
S2=[];
L2=[];
F2=[];
Y=[];
Encuesta= 'Encuesta1.xlsx';
[num,txt,raw]=xlsread(Encuesta,'C2:Q59434');
datos_txt=txt(:,2:15);
cat=categorical(datos_txt);%tratar datos como categorias para comparar
%comparar los datos por preguntas para cada una de las respuestas

for m=1:1:length(cat)
O=[O; cat(m,:) == cat(1,:)]; %datos en formato 0=fallo, 1=acierto
end

for j=1:1:length(O)
    if O(j,4)==0 && O(j,5)==1 %mal gato, bien qubit
        Q=[Q;j];
    end
    if O(j,4)==0 && O(j,6)==1 %mal gato, bien bloch
        P=[P;j];
    end
    if O(j,5)==0 && O(j,8)==1 % qubit mal, qubit bien
        A=[A;j];
    end
    if O(j,3)==0 && O(j,14)==1 % gente que ha aprendido heisenberg
        H=[H;j];
    end
end

%Voy a agrupar a la gente en 4 categorias
for k=1:1:length(O)
    l=length(find(O(k,1:7)));
    x=length(find(O(k,8:14)));
    if l==7
       T=[T;k]; % 7/7 group of experts
    elseif l>=5
       S=[S;k]; %5/7 or 6/7 group of smarts
    elseif l>=3
       L=[L;k]; %3/7 or 4/7 group of ok 
    else
       F=[F;k]; %group of stupids
    end  
     if x==7
       T2=[T2;k]; % 7/7 group of experts
    elseif x>=5
       S2=[S2;k]; %5/7 or 6/7 group of smarts
    elseif x>=3
       L2=[L2;k]; %3/7 or 4/7 group of ok 
    else
       F2=[F2;k]; %group of stupids
    end  
end
%pie chart para niveles de conocimiento
groups=[length(T);length(S);length(L);length(F)];
labels={'Expert level','High level','Medium level','Low level'};
f1=figure;
pie(groups)
legend(labels)
title('Quiz 1: Levels of knowledge')

groups2=[length(T2);length(S2);length(L2);length(F2)];
labels={'Expert level','High level','Medium level','Low level'};
f2=figure;
pie(groups2)
legend(labels)
title('Quiz 2: Levels of knowledge')

for z=1:1:14
    y=length(find(O(:,z))); %aciertos por columna
    Y=[Y;y length(O)-y];
end
f3=figure;
bar(Y(1:7,:),'stacked')
title('Quiz 1: Correct answers')

f4=figure;
bar(Y(8:14,:),'stacked')
title('Quiz 2: Correct answers')

%answers of each group to second quiz
subT=O(T,8:14);
subS=O(S,8:14);
subL=O(L,8:14);
subF=O(F,8:14);
for a=1:1:7
    t=length(find(subT(:,a))); %aciertos por columna
    B=[B;t length(T)-t];
    s=length(find(subS(:,a))); %aciertos por columna
    C=[C;s length(S)-s];
    c=length(find(subL(:,a))); %aciertos por columna
    D=[D;c length(L)-c];
    f=length(find(subF(:,a))); %aciertos por columna
    E=[E;f length(F)-f];
end
f5=figure;
bar(B,'stacked')
title('Expert level: Answers Q2')
colormap winter; 

f6=figure;
bar(C,'stacked')
title('High level: Answers Q2')
colormap winter;
f7=figure;
bar(D,'stacked')
title('Medium level: Answers Q2')
colormap winter; 
f8=figure;
bar(E,'stacked')
title('Low level: Answers Q2')
colormap winter; 

stackData=B;
stackData(:,:,2)=C;
stackData(:,:,3)=D;
stackData(:,:,4)=E;
stackData= permute(stackData,[1 3 2]);
NumGroupsPerAxis = size(stackData, 1);
NumStacksPerGroup = size(stackData, 2);
% Count off the number of bins
groupBins = 1:NumGroupsPerAxis;
MaxGroupWidth = 0.65; % Fraction of 1. If 1, then we have all bars in groups touching
groupOffset = MaxGroupWidth/NumStacksPerGroup;
f9=figure;
    hold on; 
for g=1:NumStacksPerGroup
    Z = squeeze(stackData(:,g,:));
    
    % Center the bars:
    
    internalPosCount = g - ((NumStacksPerGroup+1) / 2);
    
    % Offset the group draw positions:
    groupDrawPos = (internalPosCount)* groupOffset + groupBins;
    
    h(g,:) = bar(Z, 'stacked');
    set(h(g,:),'BarWidth',groupOffset);
    set(h(g,:),'XData',groupDrawPos);
end
colormap winter; 
title('All levels: Answer Quiz 2')
hold off
