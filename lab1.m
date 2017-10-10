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
% 
for j=1:3
     med = sum(X(:,j))/50;
     for i=1:50
         X(i,j)= X(i,j) - med;
     end
end
[B,FitInfo] = lasso(X,Y);
lassoPlot(B,FitInfo,'PlotType','Lambda','XScale','log');
%%
figure
[B,FitInfo] = lasso(X,Y,'CV',50);
lassoPlot(B,FitInfo,'PlotType','CV');
FitInfo.Lambda1SE
FitInfo.Index1SE
beta_1 =B(1,FitInfo.Index1SE)
%as seen in the graph b2 not cool man
beta_2 =B(2,FitInfo.Index1SE)
beta_3 =B(3,FitInfo.Index1SE)

BETA = [beta_1;beta_2;beta_3]
% for j=1:3
%      med = sum(X(:,j));
%      for i=1:50
%          X(i,j)= X(i,j) - med;
%      end
% end
eixo = 1:50;


Y_2=  X*BETA;
%%
%stuff

figure
hold on
hello = sum(Y)/50;

Y = Y - hello;

scatter(eixo,Y);
scatter(eixo,Y_2,'r','X');

erro =0;
for i=1:50
             erro = erro + (Y(i) - Y_2(i))^2;
end
% a maioria dos resultados, acho que todos não mudavam com tirar a medio dos X
erro

%% ridge

Beta_ridge = inv(X'*X - eye(3)*FitInfo.Lambda1SE) *X'* Y;
Y_R = X*Beta_ridge;

figure
hold on
scatter(eixo,Y);
scatter(eixo,Y_R,'r','X');

erro =0;
for i=1:50
             erro = erro + (Y(i) - Y_R(i))^2;
end
% a maioria dos resultados, acho que todos não mudavam com tirar a medio dos X
erro
%%
% o erro neste caso vai ser mais elevado pois o lasso elimina totalmente o
% b2 logo vai fazer com que o vai permanecer que o factor linear aumentando
% o erro pois o lasso é mais severo com os betas menores do que o ridge

 

%%
% load data3
% % 
% for j=1:3
%      med = sum(X(:,j));
%      for i=1:50
%          X(i,j)= X(i,j) - med;
%      end
% end
% B = ridge(X,Y,3);
% rigdePlot(B,FitInfo,'PlotType','Lambda','XScale','log');




