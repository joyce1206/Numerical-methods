clear all
close all
clc
%% Funciones
x=10:1:60;
T=6;   %Periodo
d=5;   %Profundidad
fx=(9.8*T^2/(2*pi))*tanh((2*pi*d)./x)-x;
gx=(9.8*T^2/(2*pi))*tanh((2*pi*d)./x);
dg=(9.8*T^2/(2*pi))*(-2*pi*d./x.^2).*(sech((2*pi*d)./x).^2);

%% Newton-Raphson
x0=12;
tol=0.001;
iter=1;
ea=1;
while ea>tol 
    f  = (9.8*T^2/(2*pi))*tanh((2*pi*d)./x0)-x0;
    df = (9.8*T^2/(2*pi))*(-2*pi*d./x0.^2).*(sech((2*pi*d)./x0).^2)-1;
    xr = x0-(f/df);
    ea = abs(x0-xr);
      
    veceaN(iter)  = ea;
    vecxrN(iter)  = xr;
    vecitN(iter)  = iter;
    x0            = xr;
    iter          = iter+1;
end
%% Punto Fijo
x0=12;
ea=1;
iter=1;
xx(1)=x0;
yy(1)=x0;
while ea>tol
    
     xr =(9.8*T^2/(2*pi))*tanh((2*pi*d)./x0);
     ea= abs(x0-xr);
           
     veceapf(iter)=ea;
     vectxpf(iter)=xr;
     vecitpf(iter)=iter;
     xx(end+1)    =x0;
     yy(end+1)    =xr;
     x0           =xr;
     iter         =iter+1;
     xx(end+1)    =x0;
     yy(end+1)    =x0;
end
%% Figuras
figure (1)
clf
%axes position [left bottom width height]
axes('position',[0.09 0.57 0.4 0.37])
hold on
plot(x,fx,'Linewidth',1);
grid on, box on
title('Funciones','Color','b','Fontsize',8);
xlabel('x','Fontsize',9)
plot(x,gx,'Linewidth',1);
plot(x,x,'Linewidth',1);
plot(xx(1),yy(1),'s','markersize',15,'Linewidth',1.5);
plot(xx,yy,'.-','markersize',15,'Linewidth',0.9);
plot([1 1]*vectxpf(end),[fx(end) x(end)],'--k','Linewidth',1.5)
legend('f(x)','g(x)','x','x0','Location','southeast')
xn = [0.27 0.32];
yn = [0.61 0.65];
annotation('textarrow',xn,yn,'String','raíz=38.06 ','Fontsize',8)
str = {'a)'};
text(13,-20,str)
hold off
axis tight

axes('position',[0.57 0.57 0.4 0.37])
hold on
plot(x,dg,'m','Linewidth',1);
plot([x(1) x(end)],[1 1],'--k','Linewidth',2);
plot([x(1) x(end)],[-1 -1],'--k','Linewidth',2)
grid on, box on
title('Derivada','Color','b','Fontsize',8)
xlabel('x','Fontsize',9)
legend('g\prime(x)')
str = {'b)'};
text(55,-0.75,str)
hold off

axes('position',[0.09 0.09 0.4 0.37])
hold on
plot(vecitpf,vectxpf,'o-','Linewidth',1)
grid on, box on
plot(vecitN,vecxrN,'*-','Linewidth',1)
plot([vecitpf(1) vecitpf(end)],[1 1]*vectxpf(end),'--k','Linewidth',0.8);
axis tight
title('Aproximaciones','Color','b','Fontsize',8)
legend('Punto Fijo','Newton-Raphson','Raíz','Location','northeast')
xlabel('Iteraciones','Fontsize',9)
ylabel('xr','Fontsize',9)
str = {'c)'};
text(23,34,str)
hold off

axes('position',[0.57 0.09 0.4 0.37])
hold on
plot(vecitpf,veceapf,'o-','Linewidth',1)
plot(vecitN,veceaN,'s-','Linewidth',1)
grid on, box on
axis([0 27 0 45])
title('Errores','Color','b','Fontsize',8)
str = {'d)'};
text(23,9,str)
xlabel('Iteraciones','Fontsize',9)
ylabel('Error','Fontsize',9)
legend('Punto Fijo','Newton-Raphson','Location','northeast')
hold off


