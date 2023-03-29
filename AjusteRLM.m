% Análisis de regresión lineal múltiple y Varianzas
% Trabajo Final de Métodos Numéricos por Joyce I. Casanova Chacón
clear all; close all;
clc
%% Datos
X= xlsread('Chla.xlsx');
tbl = table(X(:,1),X(:,2),X(:,3),X(:,4),X(:,5),X(:,6),X(:,7),X(:,8),...
    'VariableNames',{'per','but','fuco','hex','pras','zeax','chlb','chla'});
per= X(:,2);
but= X(:,2);
fuco= X(:,3);
hex= X(:,4);
pras= X(:,5);
zeax= X(:,6);
chlb= X(:,7);
chla= X(:,8);
%% MRLM chla-a con 8 pigmentos
lm = fitlm(tbl,'linear')
terms = '1'; % remover términos
NewMdl = removeTerms(lm,terms)
 anova(lm,'summary') %Análisis de Varianzas
tbl = anova(lm)
% Ec. RLM chla-a 8
chla8= (-1.4742+1.664)*per+(5.4365+1.4304)*but+(0.7224+0.63046)*fuco...
    +(0.90587+0.86589)*hex+(3.5611+2.4463)*pras+(0.49563+0.12525)*zeax+(2.9404+0.54348)*chlb;
%% MRLM chla-a con 4 pigmentos
tbl2 = table(X(:,2),X(:,6),X(:,7),X(:,8),...
    'VariableNames',{'but','zeax','chlb','chla'});
mdl = fitlm(tbl2,'linear')
terms2 = '1'; % remover términos
NewMdl2 = removeTerms(mdl,terms2)
 anova(mdl,'summary') %Análisis de Varianzas
tbl = anova(mdl)
% Ec. RLM chla-a 4
chla4=(7.1796+0.96629)*but+(0.60481+0.089904)*zeax+(2.779+0.49212)*chlb;
%% Figuras
clf
plot(chla,'*g')
hold on
plot(chla8,'Linewidth',1)
plot(chla4,'Linewidth',1)
grid on; box on;
axis tight
legend('Concentración chl-a','Ajuste chla-8','Ajuste chla-4','Location','northwest')