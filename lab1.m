%%ramiro e Miragaia

%%
%Pergunta 3;
clear 
close all
load data1
%a)e b) ,é pedido que a ordem 1 logo p =1
p=1;
[erro,Beta] = matrizfazer(p,x,y);

%os valores dos coeficientes
Beta

%o valore do erro
erro
%%
%pergunta 4
%a)e b) ,é pedido que a ordem 1 logo p =2
load data2
p=2;
[erro,Beta] = matrizfazer(p,x,y);

%os valores dos coeficientes
Beta

%o valore do erro
erro

%%
%pergunta 5
%a)e b) ,é pedido que a ordem 1 logo p =2
load data2a
p=2;
[erro,Beta] = matrizfazer(p,x,y);

%os valores dos coeficientes
Beta

%o valore do erro
erro


%%
% Regurization
%
load data3
[B,FitInfo] = lasso(X,Y);
lassoPlot(B,FitInfo,'PlotType','Lambda','XScale','log');


