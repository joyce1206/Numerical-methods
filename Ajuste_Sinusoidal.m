%Programa Regresión para ajuste Sinusoidal
%Métodos Numéricos // Maestría en Ciencias en Hidrometeorología
%Elaborado por Joyce I. Casanova Chacón
clear all; close all; clc;
%% Datos
d= load ('Datos_regLin.txt');
x= d(:,1);
y= d(:,2);
w1= 2*pi/7;
w2=2/7;
%% matriz Ma=b
%M= [ones(size(x)) sin(w*x) cos(w*x)];
M=[ones(size(x)) sin(w1*x) cos(w1*x) sin(w2*x) cos(w2*x)];
b=y;
%Pseudoinversa de la matriz
a=pinv(M)*b;
%% Parámetros A0, a1,b1, phi1,phi2
A0=a(1);
a1=sqrt(a(2)^2+a(3)^2);
b1=sqrt(a(4)^2+a(5)^2);
phi1=atan2(a(3),a(2));
phi2=atan2(a(5),a(4));
%% función 𝑦(𝑥)=𝐴0+𝑎1𝑠𝑒𝑛(𝜔1𝑥+𝜑1)+𝑏1𝑠𝑒𝑛(𝜔2𝑥+𝜑2)
fx=@(x)A0+a1*sin((w1*x)+phi1)+b1*sin((w2*x)+phi2);
figure
clf
plot(x,y,'.r')
hold on
fplot(fx,[0 48],'b')
axis tight; 
box on;
grid on;
xlabel('Tiempo (horas)')
ylabel('Datos')
str='f(𝑥)=0.5+0.99𝑠𝑒𝑛(𝜔1𝑥-0.01)+𝑠𝑒𝑛(𝜔2𝑥+1.56)';
text(2.7,2.7,str,'FontSize',7)