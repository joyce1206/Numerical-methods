%Programa: Regresión Lineal para ajuste Exponencial
%Métodos Numéricos // Maestría en Ciencias en Hidrometeorología
%Elaborado por Joyce I. Casanova Chacón 
clear all; close all; clc;
%% Datos
d= load ('Clase11_RegLin_exponencial1.txt');
x= d(:,1);
y= d(:,2);
d2= load ('Clase11_RegLin_exponencial2.txt');
x2= d2(:,1);
y2= d2(:,2);
d3= load ('Clase11_RegLin_exponencial3.txt');
x3= d3(:,1);
y3= d3(:,2);
%% Ajuste 1
% matriz Ma=b
M= [ones(size(x)) x];
b=log(y);
%Pseudoinversa de la matriz
a=pinv(M)*b;
%Coeficientes
a0=exp(a(1));
a1=exp(a(2));
%% Ajuste 2
%Matriz
M2= [ones(size(x2)) log(x2)];
b2=log(y2);
%Pseudoinversa de la matriz
aa=pinv(M2)*b2;
%Coeficientes
aa0=exp(aa(1));
aa1=aa(2);
%% Ajuste 3
%Matriz
M3= [ones(size(x3)) x3];
b3=log(y3);
%Pseudoinversa de la matriz
aaa=pinv(M3)*b3;
%Coeficientes
aaa0=exp(aaa(1));
aaa1=aaa(2);
%% Funciones
yx=a0*a1.^x;
yx2=aa0*(x2.^aa1);
yx3=aaa0*exp(aaa1.*x3);
%% Figuras
%axes position [left bottom width height]
clf
axes('position',[0.065 0.57 0.4 0.4])
plot(x,y,'.r')
hold on
plot(x,yx,'b','LineWidth',1)
ylabel('datos')
xlabel('tiempo (h)')
str = {'y(x)= 7.28*2.51^{x}'};
text(0.2,70,str,'FontSize',8)
box on; grid on

axes('position',[0.55 0.57 0.4 0.4])
plot(x2,y2,'.r')
hold on
plot(x2,yx2,'b','LineWidth',1)
ylabel('datos')
xlabel('tiempo (h)')
str = {'y(x)= 7.52*x^{-0.51}'};
text(5,7.5,str,'FontSize',8)
axis tight
box on; grid on

axes('position',[0.3 0.075 0.4 0.4])
plot(x3,y3,'.r')
hold on
plot(x3,yx3,'b','LineWidth',1)
ylabel('datos')
xlabel('tiempo (h)')
str = {'y(x)= 7.03*e^{2.57x}'};
text(0.1,45,str,'FontSize',8)
box on; grid on