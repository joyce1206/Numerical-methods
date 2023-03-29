clear all
close all
clc
%% Parámetros de la Función
x=0:0.05:6;
fx =@(x) 2*x.*sin(x).*cos(2*x)+x.*cos(x).*sin(2*x);
tol=0.001;
Nmax=100;
%% Raíces de la función Método de Bisección 
% [xr,veceab,veciterb,vecxrb] = MetBiseccion(xl,xu,f,tol,Nmax)
[xr2,Vea2,Vit2,Vxr2] = MetBiseccion(0.5,1.3,fx,tol,Nmax);
[xr3,Vea3,Vit3,Vxr3] = MetBiseccion(1.9,2.7,fx,tol,Nmax);
[xr4,Vea4,Vit4,Vxr4] = MetBiseccion(3.0,3.8,fx,tol,Nmax);
[xr5,Vea5,Vit5,Vxr5] = MetBiseccion(3.9,4.7,fx,tol,Nmax);
[xr6,Vea6,Vit6,Vxr6] = MetBiseccion(5.0,5.8,fx,tol,Nmax);

% Eigen funciones
z=0:0.01:4;
H=1.27;
w2=sin(z/H*xr2);
w3=sin(z/H*xr3);
w4=sin(z/H*xr4);
w5=sin(z/H*xr5);
w6=sin(z/H*xr6);
%% Figuras
%Relación de Dispersión con las raíces
y = 2*x.*sin(x).*cos(2*x)+x.*cos(x).*sin(2*x);
% axes position [left bottom width height]
figure(1)
clf
axes('position',[0.07 0.65 0.9 0.3])
plot(x,y,'k','Linewidth',0.9)
grid on; box on
hold on
plot(Vxr2(end),0,'o','MarkerSize',6,'MarkerEdgeColor','r','MarkerFaceColor','r')
plot(Vxr3(end),0,'o','MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor','b')
plot(Vxr4(end),0,'o','MarkerSize',6,'MarkerEdgeColor','c','MarkerFaceColor','c')
plot(Vxr5(end),0,'o','MarkerSize',6,'MarkerEdgeColor','m','MarkerFaceColor','m')
plot(Vxr6(end),0,'o','MarkerSize',6,'MarkerEdgeColor','g','MarkerFaceColor','g')
hold off
str = {'a)'};
text(0.3,6.5,str)
axis tight
xlabel('x','FontSize',8,'FontWeight','bold')
ylabel('f(x)','FontSize',8,'FontWeight','bold')
title('Relación de Dispersión','FontSize',8.5)
%Eigen funciones Modo 1
axes('position',[0.038 0.025 0.193 0.475])
plot(z,w2,'r','Linewidth',1)
grid on; box on
camroll(270)
xlabel('Profundidad','FontSize',7,'FontWeight','bold')
ylabel('Modo 1','FontSize',7,'FontWeight','bold')
str = {'b)'};
text(0.3,0.8,str)
axis tight
%Eigen funciones Modo 2
axes('position',[0.275 0.025 0.15 0.475])
plot(z,w3,'b','Linewidth',1)
grid on; box on
camroll(270)
xlabel('Profundidad','FontSize',7,'FontWeight','bold')
ylabel('Modo 2','FontSize',7,'FontWeight','bold')
str = {'c)'};
text(0.3,-0.8,str)
axis tight
%Eigen funciones Modo 3
axes('position',[0.465 0.025 0.15 0.475])
plot(z,w4,'c','Linewidth',1)
grid on; box on
camroll(270)
xlabel('Profundidad','FontSize',7,'FontWeight','bold')
ylabel('Modo 3','FontSize',7,'FontWeight','bold')
str = {'d)'};
text(0.3,-0.8,str)
axis tight
%Eigen funciones Modo 4
axes('position',[0.655 0.025 0.15 0.475])
plot(z,w5,'m','Linewidth',1)
grid on; box on
camroll(270)
str = {'e)'};
text(0.3,-0.8,str)
xlabel('Profundidad','FontSize',7,'FontWeight','bold')
ylabel('Modo 4','FontSize',7,'FontWeight','bold')
axis tight
%Eigen funciones Modo 5
axes('position',[0.845 0.025 0.15 0.475])
plot(z,w6,'g','Linewidth',1)
grid on; box on
camroll(270)
xlabel('Profundidad','FontSize',7,'FontWeight','bold')
ylabel('Modo 5','FontSize',7,'FontWeight','bold')
str = {'f)'};
text(0.3,-0.8,str)
axis tight