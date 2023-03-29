function [xr,veceab,veciterb,vecxrb] = MetBiseccion(xl,xu,f,tol,Nmax)
%Donde 
% xl es el extremo izquierdo del intervalo
% xu es el extremo derecho del intervalo
% f es la función
% tol=tolerancia
% Nmax= Número máximo de iteraciones

ea=abs(xl-xu); %ea es el error
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