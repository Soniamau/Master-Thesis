clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\Encuesta1.xlsx'))
X=[];
Encuesta= 'Encuesta1.xlsx';
[num,txt,raw]=xlsread(Encuesta,'C2:Q59434');
datos_txt=txt(:,2:15);
cat=categorical(datos_txt);%tratar datos como categorias para comparar
%comparar los datos por preguntas para cada una de las respuestas

    
datos=cell2table(datos_txt); %LA PRIMERA FILA SON LAS RESPUESTAS CORRECTAS
idk=datos(5,:);
A=double(ismember(datos,datos(1,:),'rows'));
A=find(A); %7/7 & 7/7 respuestas correctas


D=double(ismember(datos(:,5),datos(1,5),'rows'));
D=find(D);%bien qubit encuesta 1
D2=double(ismember(datos(:,8),datos(1,8),'rows'));
D2=find(D2);%bien qubit encuesta 2
qubit=length(D2)-length(D);


E=double(ismember(datos(:,[1:5 7:14]),datos(1,[1:5 7:14]),'rows'));
E=find(E);% respuestas correctas a las dos encuestas sin la pregunta de Bloch
F=double(ismember(datos(:,1:7),idk(1,1:7),'rows'));
F=find(F); %nolose en la primera encuesta
F2=double(ismember(datos,idk(1,:),'rows'));
F2=find(F2); %nolose a las 2 


bloch=double(ismember(datos(:,6),datos(1,6),'rows')); %aciertos Bloch
bloch=find(bloch);

H=double(ismember(datos(:,3),datos(1,3),'rows')); %aciertos Heisenberg 1
H=find(H);
H2=double(ismember(datos(:,14),datos(1,14),'rows')); %aciertos Heisenberg 2
H2=find(H2);
heisenberg=length(H2)-length(H);

