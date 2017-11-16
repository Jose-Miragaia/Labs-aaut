
%clears workspace and closes images
close all 
clear

%loads dataset
load data1;

%initializes sets as empty
[X_1 , X_2 ,X_3 ,X_1r , X_2r, X_3r]=deal([]);

%separates classes of test set
for i=1:length(ytest)
    switch ytest(i);
        case 1
            X_1 =[X_1,xtest(:,i)];
        case 2
           X_2 =[X_2,xtest(:,i)];
        case 3
            X_3 =[X_3,xtest(:,i)];
    end
end

%separates classes of train set
for i=1:length(ytrain)
    switch ytrain(i);
        case 1
           
            X_1r =[X_1r,xtrain(:,i)];
        case 2
            X_2r =[X_2r,xtrain(:,i)];
        case 3
           X_3r =[X_3r,xtrain(:,i)];
    end
end

%creates figure and makes scatter of test and train data
f=figure  
hold on

scatter (X_1(1,:),X_1(2,:),'O','fill','red')

scatter (X_2(1,:),X_2(2,:),'O','fill','blue')

scatter (X_3(1,:),X_3(2,:),'O','fill','m')

scatter (X_1r(1,:),X_1r(2,:),'X','red')

scatter (X_2r(1,:),X_2r(2,:),'X','blue')

scatter (X_3r(1,:),X_3r(2,:),'X', 'm')

%sets titles and legend 
title('test and train data')
legend('class1_{test}','class2_{test}','class3_{test}','class1_{train}','class2_{train}','class3_{train}')
xlabel('feature 1')
ylabel('feature 2')

%ensures axis have same scale
axis  equal

%calculates the mean for each class and feature
mu1=mean(X_1r');
mu2=mean(X_2r');
mu3=mean(X_3r');

%calculates the standard deviation for each class and feature (PERGUNTAR SE E MSM PRECISO POR CALCULAR A VARIANCIA E POR VAR n em vez de n-1)
sig1=sqrt(var(X_1r')*(size(X_1r',1)-1)/size(X_1r',1));% as operações descritas servem para que no calculo da variancia se divida por N em vez do habitual n-1
sig2=sqrt(var(X_2r')*(size(X_2r',1)-1)/size(X_2r',1));
sig3=sqrt(var(X_3r')*(size(X_3r',1)-1)/size(X_3r',1));

%calculates probablility for each class
p1=length(X_1r)/length(xtest)
p2=length(X_2r)/length(xtest)
p3=length(X_3r)/length(xtest)
%[p1,p2,p3]=deal(1/3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%goes throush the test set
for i =1:length(xtest)
    
    %calculates the posterior probability for each class ignoring the scale factor
   
    %Posterior1=P('1')*P(feature1|'1')*P(feature2|'1');
    p1post=p1*normpdf(xtest(1,i),mu1(1),sig1(1))*normpdf(xtest(2,i),mu1(2),sig1(2));
    p2post=p2*normpdf(xtest(1,i),mu2(1),sig2(1))*normpdf(xtest(2,i),mu2(2),sig2(2));
    p3post=p3*normpdf(xtest(1,i),mu3(1),sig3(1))*normpdf(xtest(2,i),mu3(2),sig3(2));
    
    %finds maximum and predicts class
    [num , y_res(i)] = max([p1post , p2post , p3post]);
end

%plots test data as a function of the test pattern index
figure
plot(y_res,'.');

title('Predictions')
xlabel('index')
ylabel('class predicted')



% figure(f)
% %usar para as conclusoes apagar depois
% for i=1:length(xtest)
%     if(y_res(i)-ytest(i)~=0)
%       scatter (xtest(1,i),xtest(2,i),'O','fill','black')
%       hold on
%     end
% end

%calculates error
erro_percentual = nnz(y_res-ytest)/length(xtrain) * 100