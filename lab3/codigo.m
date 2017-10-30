clear

load digits
net = patternnet([15]);
net.performFcn='mse';
net.layers{1}.transferFcn='tansig';
net.layers{2}.transferFcn='tansig';
net.divideFcn='divideind';
net.divideParam.trainInd=1:400;
net.divideParam.testInd=401:560;





% %%
% %1.3
% net.trainFcn = 'traingdm';
% net.trainParam.lr=0.3; % learning rate
% net.trainParam.mc=0.5;% Momentum constant
% net.trainParam.show=10000; % # of epochs in display
% net.trainParam.epochs=10000;% max epochs
% net.trainParam.goal=0.1; % training goal
% [net,tr] = train(net,X,T);
% %train(net,X,T);


%%
%1.4
net.trainFcn = 'traingdx'
net.trainParam.lr=1; % learning rate
net.trainParam.mc=.9;% Momentum constant
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000;% max epochs
net.trainParam.goal=0.05; % training goal
[net,tr] = train(net,X,T);
%train(net,X,T);

%%
%matriz cond


x_test=X(:,tr.testInd);
t_test=T(:,tr.testInd);
y_test = net(x_test);
plotconfusion(t_test,y_test);

% 
% %%
% for(i =1:560)
%    
%     show_digit(X,i);
%     pause();
% end