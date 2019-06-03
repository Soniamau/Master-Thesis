clc; clear all; close all;
addpath(genpath('C:\Users\Sonia\Documents\MATLAB\Encuesta1.xlsx'))
B=[];
O=[];
P=[];
Q=[];
A=[];
H=[];
T=[];
S=[];
L=[];
F=[];
Y=[];
Encuesta= 'Encuesta1.xlsx';
[num,txt,raw]=xlsread(Encuesta,'C2:Q59434');

datos_txt=txt(:,2:15); %LA PRIMERA FILA SON LAS RESPUESTAS CORRECTAS
cat=categorical(datos_txt);%tratar datos como categorias para comparar
%comparar los datos por preguntas para cada una de las respuestas

E1P1=[length(find(cat(:,1)=='Los electrones giran en órbitas cuantizadas alrededor del núcleo')); length(find(cat(:,1)=='Los electrones giran en órbitas elípticas alrededor del núcleo'));
    length(find(cat(:,1)=='Los electrones giran aleatoriamente alrededor del núcleo'));length(find(cat(:,1)=='Los electrones están indeterminados y son orbitales con distintas formas'));length(find(cat(:,1)=='No lo sé'))];
labels1 = {'Electrons move around nucleus in quantized orbits','Electrons move around nucleus in elliptical orbits','Electrons move around nucleus randomly','Electrons are undefined and form orbitals of several shapes','I don’t know'};
title1 = ('Question 1. Where are the electrons located in an atom?');
f1= figure;
pie3(E1P1)
legend(labels1,'Location','southoutside','Orientation','vertical')
title(title1)
colormap jet;

E1P2=[length(find(cat(:,2)=='Puede estar en muchos estados a la vez')); length(find(cat(:,2)=='Puede estar sólo en 2 estados a la vez'));
    length(find(cat(:,2)=='Puede estar sólo en un número par de estados a la vez'));length(find(cat(:,2)=='Puede estar sólo en un número impar de estados a la vez'));length(find(cat(:,2)=='No lo sé'))];
labels2 = {'Can be in several states','Can only be in two states','Can only be in even number of states','Can only be in odd number of states','I don’t know'};
title2=('Question 2. A general quantum particle:');
f2= figure;
pie3(E1P2)
legend(labels2,'Location','southoutside','Orientation','vertical')
title(title2)
colormap jet;

E1P3=[length(find(cat(:,3)=='Una partícula puede estar a la vez en dos lugares diferentes')); length(find(cat(:,3)=='Dos partículas pueden estar a la vez en el mismo lugar'));
    length(find(cat(:,3)=='No se pueden determinar a la vez la posición y la velocidad de una partícula'));length(find(cat(:,3)=='No se puede observar un fotón y un electrón a la vez'));length(find(cat(:,3)=='No lo sé'))];
labels3 = {'A particle can be in two different places at once','Two particles can be in the same place at once','The position and the velocity of a particle cannot both be determined exactly','A photon and an electron cannot be both observed','I don’t know'};
title3=('Question 3. What does the Heisenberg Uncertainty Principle say?');
f3= figure;
pie3(E1P3)
legend(labels3,'Location','southoutside','Orientation','vertical')
title(title3)
colormap jet;

E1P4=[length(find(cat(:,4)=='Es un experimento que nunca se ha realizado debido a los derechos de los animales')); length(find(cat(:,4)=='Es un experimento imaginario o mental'));
    length(find(cat(:,4)=='Es un experimento propuesto por Einstein y realizado por Schrödinger en 1937'));length(find(cat(:,4)=='Es un experimento realizado en Viena en 1935 usando un gato de raza pura'));length(find(cat(:,4)=='No lo sé'))];
labels4 = {'It has never been realized due to animal rights','It is an imaginary or thought experiment','It was proposed by Einstein and realized by Schrödinger in 1937','It was realized in Vienna in 1935 with a pure-bred cat','I don’t know'};
 title4=('Question 4. The famous Schrödinger’s cat experiment :');
f4= figure;
pie3(E1P4)
legend(labels4,'Location','southoutside','Orientation','vertical')
title(title4)
colormap jet;

E1P5=[length(find(cat(:,5)=='Es un aparato para medir impulsos eléctricos cuánticos en laboratorios')); length(find(cat(:,5)=='Es la unidad mínima de información cuántica'));
    length(find(cat(:,5)=='Es un estado cúantico de dos partículas entrelazadas'));length(find(cat(:,5)=='Es una unidad de medida de la frecuencia de un láser'));length(find(cat(:,5)=='No lo sé'))];
labels5 ={'It is a measurement instrument for quantum electrical pulses','It is the minimal unit of quantum information','It is a quantum entangled state of two particles','It is the unit used to measure the frequency of a laser','I don’t know'};
title5=('Question 5. What is a qubit?');
f5= figure;
pie3(E1P5)
legend(labels5,'Location','southoutside','Orientation','vertical')
title(title5)
colormap jet;

E1P6=[length(find(cat(:,6)=='Es una representación geométrica de estados cuánticos puros de dos niveles')); length(find(cat(:,6)=='Es una esfera de 4 dimensiones'));
    length(find(cat(:,6)=='Es una representación de los electrones en un átomo en un orbital S'));length(find(cat(:,6)=='Es la representación euclidea de un qubit de 3 dimensiones'));length(find(cat(:,6)=='No lo sé'))];
labels6 ={'It is a geometric representation of two-level quantum states','It is a 4-dimensional sphere','It is a representation of electrons in atomic orbital S','It is a Euclidean representation of a 3-dimensional qubit','I don’t know'};
title6=('Question 6. What is the Bloch sphere?');
f6= figure;
pie3(E1P6)
legend(labels6,'Location','southoutside','Orientation','vertical')
title(title6)
colormap jet;

E1P7=[length(find(cat(:,7)=='Es una teoría con algunos errores porque las partículas cuánticas son difíciles de estudiar')); length(find(cat(:,7)=='Es una teoría que en el futuro permitirá viajar en el tiempo y en el espacio'));
    length(find(cat(:,7)=='Es una teoría probabilística que no tiene una interpretación única entre los físicos'));length(find(cat(:,7)=='Es una teoría poco consolidada porque hay muy pocos experimentos que la demuestren'));length(find(cat(:,7)=='No lo sé'))];
labels7={'It is a theory with some errors because quantum particles are difficult to study','In the future it will make possible to travel across time and space','It is a probabilistic theory with many interpretations','It is a weak theory because there are few successful experiments','I don’t know'};
title7=('Question 7. What is one of the most important features of quantum physics?');
f7= figure;
pie3(E1P7)
legend(labels7,'Location','southoutside','Orientation','vertical')
title(title7)
colormap jet;

E2P1=[length(find(cat(:,8)=='Es un aparato para medir impulsos eléctricos cuánticos en laboratorios')); length(find(cat(:,8)=='Es la unidad mínima de información cuántica'));
    length(find(cat(:,8)=='Es un estado cúantico de dos partículas entrelazadas'));length(find(cat(:,8)=='Es una unidad de medida de la frecuencia de un láser'));length(find(cat(:,8)=='No lo sé'))];
labels8 ={'It is a measurement instrument for quantum electrical pulses','It is the minimal unit of quantum information','It is a quantum entangled state of two particles','It is the unit used to measure the frequency of a laser','I don’t know'};
title8=('Question 1. What is a qubit?');
f8= figure;
pie3(E2P1)
legend(labels8,'Location','southoutside','Orientation','vertical')
title(title8)
colormap jet;

E2P2=[length(find(cat(:,9)=='Significa proyectar el qubit sobre un eje')); length(find(cat(:,9)=='Significa calcular la probabilidad de un estado del qubit'));
    length(find(cat(:,9)=='Significa calcular el coeficiente de un estado del qubit'));length(find(cat(:,9)=='Significa proyectar el qubit sobre un plano'));length(find(cat(:,9)=='No lo sé'))];
labels9={'It means to project the qubit onto an axis','It means to calculate the probability of the state','It means to calculate the coefficient of the state','It means to project onto a plane','I don’t know'};
title9=('Question 2. What does it mean to measure a qubit?');
f9= figure;
pie3(E2P2)
legend(labels9,'Location','southoutside','Orientation','vertical')
title(title9)
colormap jet;

E2P3=[length(find(cat(:,10)=='Sólo puede estar en un estado (0+1)')); length(find(cat(:,10)=='Puede estar en dos estados (0+1) y (0-1)'));
    length(find(cat(:,10)=='Puede estar en cualquier estado que sea superposición positiva y negativa de 0 y 1'));length(find(cat(:,10)=='Puede estar en cualquier estado que sea superposición positiva, negativa y compleja de 0 y 1'));length(find(cat(:,10)=='No lo sé'))];
labels10={'The qubit can only be in the state (0+1)','The qubit can be in two states (0+1) and (0-1)','The qubit can be in any positive and negative superposition of 0 and 1','The qubit can be in any positive, negative and complex superposition of 0 and 1','I don’t know'};
title10=('Question 3. There are two possible states for a qubit, 0 and 1, then:');
f10= figure;
pie3(E2P3)
legend(labels10,'Location','southoutside','Orientation','vertical')
title(title10)
colormap jet;

E2P4=[length(find(cat(:,11)=='El resultado está determinado y es único')); length(find(cat(:,11)=='El resultado es aleatorio porque la física cuántica está incompleta'));
    length(find(cat(:,11)=='El resultado es aleatorio porque la física cuántica es un teoría probabilística'));length(find(cat(:,11)=='El resultado está determinado si sabemos el estado inicial del qubit'));length(find(cat(:,11)=='No lo sé'))];
labels11={'The resulting state is determined and it is unique','The resulting state is aleatory because quantum physics is incomplete','The resulting state is aleatory because quantum physics is a probabilistic theory','The resulting state is determined if we know the initial state','I don’t know'};
title11=('Question 4. Before measuring a qubit in any basis:');
f11= figure;
pie3(E2P4)
legend(labels11,'Location','southoutside','Orientation','vertical')
title(title11)
colormap jet;

E2P5=[length(find(cat(:,12)=='El estado inicial se destruye')); length(find(cat(:,12)=='El estado inicial es obtenido'));
    length(find(cat(:,12)=='El estado inicial es aleatorio'));length(find(cat(:,12)=='El estado final se destruye'));length(find(cat(:,12)=='No lo sé'))];
labels12={'The initial state is destroyed','The initial state is obtained','The initial state is random','The final state is destroyed','I don’t know'};
title12=('Question 5. What happens once we measure the qubit?');
f12= figure;
pie3(E2P5)
legend(labels12,'Location','southoutside','Orientation','vertical')
title(title12)
colormap jet;

E2P6=[length(find(cat(:,13)=='Al medir en Z lo observaremos apuntando hacia arriba con probabilidad del 100%')); length(find(cat(:,13)=='Al medir en X lo observaremos apuntando hacia arriba con probabilidad del 100%'));
    length(find(cat(:,13)=='Al medir en Z lo observaremos apuntando hacia arriba con probabilidad del 50%'));length(find(cat(:,13)=='Al medir en X lo observaremos apuntando hacia arriba con probabilidad del 50%'));length(find(cat(:,13)=='No lo sé'))];
labels13={'If we measure in Z-basis we will observe it pointing upwards with 100% probability','If we measure in X-basis we will observe it pointing upwards with 100% probability','If we measure in Z-basis we will observe it pointing upwards with 50% probability','If we measure in X-basis we will observe it pointing upwards with 50% probability','I don’t know'};
title13=('Question 6. A qubit located in X-axis points in right direction on the Bloch sphere.');
f13= figure;
pie3(E2P6)
legend(labels13,'Location','southoutside','Orientation','vertical')
title(title13)
colormap jet;

E2P7=[length(find(cat(:,14)=='Un qubit puede estar en dos estados a la vez con probabilidad del 50% en cada uno')); length(find(cat(:,14)=='No se puede determinar a la vez la componente X y la componente Z de un qubit'));
    length(find(cat(:,14)=='No se puede medir un qubit en X y luego en Z'));length(find(cat(:,14)=='No se pueden hacer copias de un qubit'));length(find(cat(:,14)=='No lo sé'))];
labels14={'A qubit can be simultaneously in two different states with 50% probability each one','The X component and Z component of a qubit cannot both be determined exactly','A X-basis measurement cannot be followed by a Z-basis measurement','A qubit cannot be cloned','I don’t know'};
title14=('Question 7. What does Heisenberg Uncertainty Principle say regarding a qubit?');
f14= figure;
pie3(E2P7)
legend(labels14,'Location','southoutside','Orientation','vertical')
title(title14)
colormap jet;


edad=raw(:,1);
a=isnan(num(:,1));
a1=find(a);
for i=1:1:size(a1)
    B=[B;edad(a1(i))];
end
age= num(~isnan(num));
age=round(age);
age(age>90) = [];
age(age<5)=[];
elements=unique(age);
n=length(elements);
stat=[mean(age),mode(age),median(age),std(age),var(age)];
f15=figure;
histogram(age,n)
title('Age Range')