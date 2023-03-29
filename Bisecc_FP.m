%% Método de Bisección y Posición Falsa
%Programa Tarea 3 de Métodos Numéricos
%Elaborado por Joyce I. Casanova Chacón
clear all
close all
clc
%% Método de Bisección
f=@(x) 2*x.*sin(x).*cos(2*x)+x.*cos(x).*sin(2*x);
xl=3.0;   %Extremo izquierdo del intervalo
xu=3.8; %Extremo derecho del intervalo
tol=0.01;  
ea=abs(xl-xu);
Nmax=100;  
iter=0;

while (iter<Nmax)&&(ea>tol)
    fl=f(xl);
    xr=(xl+xu)/2;
    fr=f(xr);  
    
    if fl*fr<0
       xu=xr;
    else
        xl=xr;
    end    
    ea=abs(xl-xu);
    
    iter=iter+1;
    veceab(iter)=ea;
    vecxrb(iter)=xr;
    veciterb(iter)=iter; 
    
 end
%% Método de Posición Falsa 
F=@(x) 2*x.*sin(x).*cos(2*x)+x.*cos(x).*sin(2*x);
Xl=3.0;   %Extremo izquierdo del intervalo
Xu=3.8; %Extremo derecho del intervalo
Tol=0.01;  
Ea=abs(Xl-Xu);
Imax=100;  
Iter=0;

while (Iter<Imax)&&(Ea>Tol)
    
    Fl=F(Xl);
    Fu=F(Xu);
    Xr=Xl-Fl*((Xu-Xl)/(Fu-Fl));
    Fr=F(Xr);    
      
    if Fl*Fr<0
       Xu=Xr;
    else 
       Xl=Xr; 
    end    
    Ea=abs(Xl-Xu);
           
    Iter=Iter+1;
    veceafp(Iter)=Ea;
    vecxrfp(Iter)=Xr;
    veciterfp(Iter)=Iter;
    
end
%% Figuras
x=linspace(0,10,200);
y = 2*x.*sin(x).*cos(2*x)+x.*cos(x).*sin(2*x);

%Para la línea de la raíz
A = 3.14;  
B = repmat([1],1,100);
%El último dígito es el valor máx de iteraciones, p.e.,100
raiz=A*B;
xi=[0:99];

figure(1)
axes('position',[0.09 0.57 0.4 0.37])
hold on
plot(x,y,'Linewidth',1);
plot(vecxrb(end),0,'-p','MarkerSize',12, 'MarkerFaceColor','red')
grid on, box on
title('Relación de Dispersión','Fontsize',9);
xlabel('x','Fontsize',9)
ylabel('f(x)','Fontsize',9)
axis tight
hold off

axes('position',[0.57 0.57 0.4 0.37])
hold on
plot(veciterb,veceab,'o-','LineWidth',1)
plot(veciterfp,veceafp,'*-','LineWidth',0.8)
grid on, box on
% axis tight
xlabel('Iteraciones','Fontsize',9)
ylabel('Error','Fontsize',9)
title('Aproximación Error','Fontsize',9)
legend('Bisección','Regla Falsa')
hold off

axes('position',[0.3 0.09 0.4 0.37])
hold on
plot(veciterb,vecxrb,'o-k','LineWidth',1);
plot(veciterfp,vecxrfp,'s-m','LineWidth',1);
plot(xi,raiz,'--g','LineWidth',1.5);
grid on, box on
% axis tight
legend('Bisección','Regla Falsa','Raíz','Location','northeast')
title('Aproximació xr','Fontsize',9)
xlabel('Iteraciones','Fontsize',9)
ylabel('xr','Fontsize',9)
