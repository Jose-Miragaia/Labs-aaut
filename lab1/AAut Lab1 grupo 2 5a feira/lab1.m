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
hold on 
hline = refline([0 1.425]);
hline = refline([0 2.9385]);
hline = refline([0 0.064508]);

%%

[B,FitInfo] = lasso(X,Y,'CV',50);
lassoPlot(B,FitInfo,'PlotType','CV');
FitInfo.Lambda1SE
FitInfo.Index1SE
beta_1 =B(1,FitInfo.Index1SE);
%as seen in the graph b2 not cool man
beta_2 =B(2,FitInfo.Index1SE);
beta_3 =B(3,FitInfo.Index1SE);

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

title('Lasso com o labda escolhido');
plot(eixo,Y);
plot(eixo,Y_2);
xlabel('index');
ylabel('Y,Y_2');
legend('training_data','results with achieved beta');

erro =0;
for i=1:50
             erro = erro + (Y(i) - Y_2(i))^2;
end
% a maioria dos resultados, acho que todos não mudavam com tirar a medio dos X
erro
%%

%caso regular em que o lambda é quase 0

beta_1 =B(1,1);
%as seen in the graph b2 not cool man
beta_2 =B(2,1);
beta_3 =B(3,1);

BETA = [beta_1;beta_2;beta_3]

Y_LS=  X*BETA;

figure
hold on
title('Lasso com o labda = 0 (LS)');

plot(eixo,Y);
plot(eixo,Y_LS);
xlabel('index');
ylabel('Y,Y_LS');
legend('training_data','results with LS method');

erro =0;
for i=1:50
             erro = erro + (Y(i) - Y_LS(i))^2;
end
erro

%% ridge
% 
% Beta_ridge = inv(X'*X - eye(3)*FitInfo.Lambda1SE) *X'* Y;
% 
% Y_Lambda=  X*Beta_ridge;
% figure
% hold on
% title('Ridge com o labda escolhido no Lasso');
% 
% plot(eixo,Y);
% plot(eixo,Y_Lambda);
% legend('training_data','results with achieved beta');
% erro =0;
% for i=1:50
%              erro = erro + (Y(i) - Y_Lambda(i))^2;
% end
% erro

BETA_R = ridge(Y,X,FitInfo.Lambda1SE)
Y_Ridge=  X*BETA_R;

figure
hold on
title('Ridge com o beta escolhido pelo função ridge()');
plot(eixo,Y);
plot(eixo,Y_Ridge);

xlabel('index');
ylabel('Y,Y_Ridge');
legend('training_data','results with achieved beta through ridge');

erro =0;

for i=1:50
             erro = erro + (Y(i) - Y_Ridge(i))^2;
end
erro

%%
% o erro neste caso vai ser mais elevado pois o lasso elimina totalmente o
% b2 logo vai fazer com que o vai permanecer que o factor linear aumentando
% o erro pois o lasso é mais severo com os betas menores do que o ridge

 
%%
% %%
% load data3
% % 
% 
% %%
% for j=1:3
%      med = sum(X(:,j));
%      for i=1:50
%          X(i,j)= X(i,j) - med;
%      end
% end

%%
% B = ridge(Y,D,FitInfo.Lambda1SE);
% figure
% plot(k,B,'LineWidth',2)
% ylim([-100 100])
% grid on
% xlabel('Ridge Parameter')
% ylabel('Standardized Coefficient')
% title('{\bf Ridge Trace}')
% legend('x1','x2','x3','x1x2','x1x3','x2x3')
% 
% 
% 
% 

figure (3)
xlabel('x');
ylabel('Y,Y-LS');
title('Cosine fit with outlier');
legend('Training Data','Fit');

figure (1)
xlabel('x');
ylabel('Y,Y-LS');
title('linear fit');
legend('Training Data','Fit');


figure (2)
xlabel('x');
ylabel('Y,Y-LS');
title('Cosine fit');
legend('Training Data','Fit');


%%
load data3
% 

%%
%calcular o LS necessário para o caso do beta
for j=1:3
     med = sum(X(:,j));
     for i=1:50
         X(i,j)= X(i,j) - med;
     end
end

for i=1:3
    [erro,B] = matrizfazer(1,X(:,i),Y);
    BETA_NOME(i) = B(2);
end



