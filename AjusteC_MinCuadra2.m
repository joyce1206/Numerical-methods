%Programa para realizar Ajustes de curvas por mínimos cuadrados
%Métodos Numéricos// Maestría en C. en Hidrometeorología// U.de G.
%Elaborado por Joyce I. Casanova Chacón // 
%%
clear all; close all; clc;
%% Parámetros
X= [0 2 4 6 9 11 13 15 17 19 23 25 28];
Y= [1.2 0.6 0.4 -0.2 0 -0.6 -0.4 -0.2 -0.4 0.2 0.4 1.2 1.8];
m=length(X);
xi=sum(X);
yi=sum(Y);
Xi2=sum(X.^2);
Xi3=sum(X.^3);
Xi4=sum(X.^4);
Xi5=sum(X.^5);
Xi6=sum(X.^6);
Xi7=sum(X.^7);
Xi8=sum(X.^8);
xiyi=sum(X.*Y);
xi2yi=sum(X.^2.*Y);
xi3yi=sum(X.^3.*Y);
xi4yi=sum(X.^4.*Y);
%% Ajuste Lineal
a0=(Xi2*yi-xi*xiyi)/(m*Xi2-xi^2)
a1=(m*xiyi-xi*yi)/(m*Xi2-xi^2)
P=a1.*X+a0;
%error
e=(Y-P.^2);
E=sum(e);
Fx=a0*X.^0+a1*X.^1;
%% Ajuste Constante
a0c=mean(Y)
Fx0=a0c*X.^0;
%% Ajuste Cuadrático
M2=[m xi Xi2; xi Xi2 Xi3; Xi2 Xi3 Xi4];
b2=[yi; xiyi; xi2yi];
a2= inv(M2)*b2
Fx2= a2(1)*X.^0+a2(2)*X.^1+a2(3)*X.^2;
%% Ajuste Cúbico
M3=[m xi Xi2 Xi3; xi Xi2 Xi3 Xi4; Xi2 Xi3 Xi4 Xi5; Xi3 Xi4 Xi5 Xi6];
b3=[yi; xiyi; xi2yi; xi3yi];
a3= inv(M3)*b3
Fx3= a3(1)*X.^0+a3(2)*X.^1+a3(3)*X.^2+a3(4)*X.^3;
%% Ajuste 4to Orden
M4=[m xi Xi2 Xi3 Xi4; xi Xi2 Xi3 Xi4 Xi5; Xi2 Xi3 Xi4 Xi5 Xi6; Xi3 Xi4 Xi5 Xi6 Xi7; Xi4 Xi5 Xi6 Xi7 Xi8];
b4=[yi; xiyi; xi2yi; xi3yi; xi4yi];
a4= inv(M4)*b4
Fx4= a4(1)*X.^0+a4(2)*X.^1+a4(3)*X.^2+a4(4)*X.^3+a4(5)*X.^4;
%% Figuras
t = tiledlayout(3,2); 
%Fig AConstante
nexttile
plot(X,Y,'*b')
hold on
plot(X,Fx0,'Linewidth',1)
axis tight; box on; grid on;
xlabel('Eje x','Fontsize',7)
ylabel('Eje y','Fontsize',7)
legend('Datos','Ajuste Constante','Location','northwest','Fontsize',6)
title('F(x)=0.308 \bullet x^0','Fontsize',6)
%Fig ALineal
nexttile
plot(X,Y,'*b')
hold on
plot(X,Fx,'Linewidth',1)
axis tight; box on; grid on;
xlabel('Eje x','Fontsize',7)
ylabel('Eje y','Fontsize',7)
title('F(x)=0.027 \bullet X^0+0.021 \bullet X^1','Fontsize',6)
legend('Datos','Ajuste Lineal','Location','northwest','Fontsize',6)
%Fig ACuadrático
nexttile
plot(X,Y,'*b')
hold on
plot(X,Fx2,'Linewidth',1)
axis tight; box on; grid on;
xlabel('Eje x','Fontsize',7)
ylabel('Eje y','Fontsize',7)
title('F(x)=1.125 \bullet X^0-0.241 \bullet X^1+0.010 \bullet X^2','Fontsize',6)
legend('Datos','Ajuste Cuadrático','Location','northwest','Fontsize',7)
%Fig ACúbico
nexttile
plot(X,Y,'*b')
hold on
plot(X,Fx3,'Linewidth',1)
axis tight; box on; grid on;
xlabel('Eje x','Fontsize',7)
ylabel('Eje y','Fontsize',7)
title('F(x)=1.153 \bullet X^0-0.257 \bullet X^1+0.011 \bullet X^2-0.000 \bullet X^3','Fontsize',5)
legend('Datos','Ajuste Cúbico','Location','northwest','Fontsize',6)
%Fig A4toOrden
nexttile
plot(X,Y,'*b')
hold on
plot(X,Fx4,'Linewidth',1)
axis tight; box on; grid on;
xlabel('Eje x','Fontsize',7)
ylabel('Eje y','Fontsize',7)
title('F(x)=1.175 \bullet X^0-0.280 \bullet X^1+0.015 \bullet X^2-0.000 \bullet X^3+0.000 \bullet X^4','Fontsize',5)
legend('Datos','Ajuste Cuarto Orden','Location','northwest','Fontsize',6)