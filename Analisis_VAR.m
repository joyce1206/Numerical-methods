%Programa para Análisis de Varianzas por Joyce I. Casanova Chacón
%M. en C. en Hidrometeorología// Métodos numéricos
clear all; close all;
clc
%% Datos de Temperatura media de enero
X=[19 13 12 23 14 15 19 23 8 21];
Y=[34 28 25 35 32 28 35 33 30 40];

[~,dum] = sort(X);
X = X(dum);
Y = Y(dum);
x = X';          
y = Y';
Ybar = mean(y);
b = y;
%% Funciones
% Lineal 𝑦(𝑥)=𝑎0+𝑎1𝑥
Ml = [x.^0 x.^1];
al = pinv(Ml)*b;
Yhatl = Ml*al;
Fxl= al(1)*X.^0+al(2)*X.^1;
% Cuadrática 𝑦(𝑥)=𝑎0+𝑎1𝑥+𝑎2𝑥2
M2 = [x.^0 x.^1 x.^2];
a2 = pinv(M2)*b;
Yhat2 = M2*a2;
Fx2= a2(1)*x.^0+a2(2)*x.^1+a2(3)*x.^2;
% Cúbica 𝑦(𝑥)=𝑎0+𝑎1𝑥+𝑎2𝑥2+𝑎3𝑥3
M3 = [x.^0 x.^1 x.^2 x.^3];
a3 = pinv(M3)*b;
Yhat3 = M3*a3;
Fx3= a3(1)*X.^0+a3(2)*X.^1+a3(3)*X.^2+a3(4)*X.^3;
%% Errores
SSTO = sum((y-Ybar).^2);
%Error de las Regresiones
SSRl = sum((Yhatl-Ybar).^2);
SSR2 = sum((Yhat2-Ybar).^2);
SSR3 = sum((Yhat3-Ybar).^2);
%Error de los Ajustes
SSEl = sum((y-Yhatl).^2);
SSE2 = sum((y-Yhat2).^2);
SSE3 = sum((y-Yhat3).^2);
% Coeficiente de Determinación 
R2l = SSRl/SSTO;
R22 = SSR2/SSTO;
R23 = SSR3/SSTO;
%% Estadístico
%Grados de Libertad 
[nl,ml] = size(Ml);
dfl = nl-ml;
[n2,m2] = size(M2);
df2 = n2-m2;
[n3,m3] = size(M3);
df3 = n3-m3;
%Varianza AjusteLineal
S2l = SSEl/dfl;
S22 = SSE2/df2;
S23 = SSE3/df3;
%Desviación Estándar
sl = sqrt(diag(S2l*(inv(Ml'*Ml))));
asl = abs(al./sl);
s2 = sqrt(diag(S22*(inv(M2'*M2))));
as2 = abs(a2./s2);
s3 = sqrt(diag(S23*(inv(M3'*M3))));
as3 = abs(a3./s3);
%tStudent
tstul = abs(tinv(0.025,8));
tstu2 = abs(tinv(0.025,7));
tstu3 = abs(tinv(0.025,6));
%% Figuras
clf
axes('position',[0.065 0.57 0.4 0.39])
plot(X,Y,'*b')
hold on
plot(X,Fxl,'--k','Linewidth',1.5)
xlabel('MedMin(°C)','Fontsize',8)
ylabel('MedMax (°C)','Fontsize',8)
legend('Datos','Fontsize',8','Location','southeast')
str = {'y(x)=21.6215*x^{0}+0.6215*x^{1}'};
text(10,37,str,'FontSize',7)
grid on; box on;
axis tight
title('Ajuste Lineal','Fontsize',8)

axes('position',[0.56 0.57 0.4 0.39])
plot(X,Y,'*b')
hold on
plot(X,Fx2,'--k','Linewidth',1.5)
xlabel('MedMin(°C)','Fontsize',8)
ylabel('MedMax (°C)','Fontsize',8)
legend('Datos','Fontsize',8','Location','southeast')
str = {'y(x)=27.2715*x^{0}-0.1444*x^{1}+0.0236*x^{2}'};
text(10,37,str,'FontSize',7)
grid on; box on;
axis tight
title('Ajuste Cuadrático', 'Fontsize',8)

axes('position',[0.31 0.07 0.4 0.39])
plot(X,Y,'*b')
hold on
plot(X,Fx3,'--k','Linewidth',1.5)
xlabel('MedMin(°C)','Fontsize',8)
ylabel('MedMax (°C)','Fontsize',8)
legend('Datos','Fontsize',8','Location','southeast')
str = {'y(x)=98.5394*x^{0}-15.9527*x^{1}+1.1092*x^{2}-0.0233*x^{3}'};
text(9,38,str,'FontSize',7)
grid on; box on;
axis tight
title('Ajuste Cúbico','Fontsize',8)
%% Tablas 
%Errores
Ajuste= {'Lineal';'Cuadrático';'Cúbico'};
SSE=[SSEl;SSE2;SSE3];
R2=[R2l;R22;R23];
T1=table(Ajuste,SSE,R2)