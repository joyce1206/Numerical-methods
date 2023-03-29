%% Programa para modelar un objeto esférico de acero que cae al océano.
% Tarea 1: programación de ecuaciones // Materia: Métodos Numéricos
% Elaborado por Joyce I. Casanova Chacón
clear all 
close all
clc
%% Parámetros
m = 5;          %masa en kg
r = 0.07;          %Radio en metros
rho = 1025;      %Densidad
g = 9.8;
mu = 0.001002;     %Viscocidad
Cd = 0.47;       %Coeficiente de arrastre (Esfera)
Vol =(4/3)*pi*r^3; %Volumen de una esfera
Ac = pi*r^2;     %Área Transversal 
%% Fórmulas del Sistema
c1 = 6*pi*mu*r/m;
c2 = 0.5*Cd*rho*Ac/m;
c3 = g-(rho*Vol*g/m);
%% Solución Numérica Ec 5
tf= 3;
dt= 0.25; 
t1(1)= 0;
v1(1)= 0;
n=tf/dt;  

for i= 1:n
    v1(i+1)= v1(i)+dt*(c3-c1*v1(i)-c2*v1(i)^2);
    t1(i+1)= t1(i)+dt;
end
%% Velocidad Terminal Ec. 6
vt = roots([c2 c1 -c3]);
vel = vt(2);
vtr =[vel vel vel vel vel vel vel vel vel vel vel vel vel];

%% Solución Analítica Ec 3
V1 = (vt(1)*vt(2)*(1-exp((vt(2)-vt(1))*t1)))./(vt(2)-vt(1)*exp((vt(2)-vt(1))*t1));

%% Solución de la ec 2 con ode45
tRange = [0:0.25:3];
v0 = 0;
[tSol,vSol] = ode45(@funsis,tRange,v0)

%% Figuras
figure
plot(t1,v1,'LineWidth',1.5);
hold on
grid on
plot(t1,vtr,'--','LineWidth',2)
plot(t1,V1,'LineWidth',1.5)
plot (tSol,vSol,'LineWidth',1.5);
ylabel('Velocidad (m/s)')
xlabel('Tiempo (s)')
legend('Sol. Aproximada','Vel Terminal','Sol.Analítica','Sol. ode45','Location','southeast');
%% funcion para ode45

function dvdt = funsis(t,v)

c1 = 2.6442e-04;
c3 = 6.9136;
c2 = 0.741596507824773;

dvdt = c3-c1*v-c2*v^2;

end