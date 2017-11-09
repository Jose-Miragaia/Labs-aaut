%% 3lab aaut José Miragaia e João Ramiro
%% thursday 17H - 18:30H
%%

clear
close all

 load digits
 net = patternnet([15]);
 net.performFcn='mse';
 net.layers{1}.transferFcn='tansig';
 net.layers{2}.transferFcn='tansig';
 net.divideFcn='divideind';
 net.divideParam.trainInd=1:400;
 net.divideParam.testInd=401:560;




%%
%1.3
net.trainFcn = 'traingdm';
net.trainParam.lr= .9; % learning rate
net.trainParam.mc= 0.4;% Momentum constant
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.05; % training goal
[net,tr] = train(net,X,T);
%train(net,X,T);
% 

%
%% 1.4
net.trainFcn = 'traingdx'
net.trainParam.lr= 0.9; % learning rate
net.trainParam.mc= .7;% Momentum constant
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.05; % training goal
[net,tr] = train(net,X,T);
train(net,X,T);

%%
%matriz cond


x_test=X(:,tr.testInd);
t_test=T(:,tr.testInd);
y_test = net(x_test);
plotconfusion(t_test,y_test);

%% 2

%% 2.3

load regression_data
figure (1)
hold on
net = fitnet(40);
net.layers{2}.transferFcn='purelin';
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005;
net.performFcn='mse';
net.divideFcn='divideind';
net.divideParam.trainInd=1:70;
net.divideParam.valInd=71:85;
net.divideParam.testInd=86:100;


 [net tr] = train (net,X,T);
 figure 
 hold on
 scatter (X(1:70),T(1:70),'X')
scatter (X(86:100),T(86:100))
 c = -1:0.001:1;
 y = net(c);
 plot(c,y)

 
% para ter os valores para juntar os dois graficos
  figure 
 hold on
 scatter (X(1:70),T(1:70),'X')
scatter (X(86:100),T(86:100))
 c = -1:0.001:1;
 y = net(c);
 plot(c,y)

%%  2.4


hold on
load regression_data
net = fitnet(40);
net.layers{2}.transferFcn='purelin';
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.005;
net.performFcn='mse';
net.divideFcn='divideind';
net.divideParam.trainInd=1:70;
net.divideParam.testInd=71:100;

[net tr] = train (net,X,T);
figure
hold on
scatter (X(1:70),T(1:70),'X')
scatter (X(86:100),T(86:100))
y = net(c);
plot(c,y)
legend('training data','test data','estimated function');
title('overfitting');


%% ultimo gráfico com todos os valores juntos
figure (3)
hold on 
plot(c,y)

