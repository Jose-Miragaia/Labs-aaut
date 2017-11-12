close all 
clear

load data1;

k=1;
j=1;
m=1;

for i=1:length(ytest)
    switch ytest(i);
        case 1
            X_1(:,k) =  xtest(:,i);
            k=k+1;
        case 2
            X_2(:,j) =  xtest(:,i);
            j=j+1;
        case 3
            X_3 (:,m)=  xtest(:,i);
            m=m+1;
    end
end

k=1;
j=1;
m=1;


for i=1:length(ytrain)
    switch ytrain(i);
        case 1
            X_1r(:,k) =  xtrain(:,i);
            k=k+1;
        case 2
            X_2r(:,j) =  xtrain(:,i);
            j=j+1;
        case 3
            X_3r (:,m)=  xtrain(:,i);
            m=m+1;
    end
end


figure  
hold on

scatter (X_1(1,:),X_1(2,:))

scatter (X_2(1,:),X_2(2,:),'X')

scatter (X_3(1,:),X_3(2,:), 'd')

scatter (X_1r(1,:),X_1r(2,:))

scatter (X_2r(1,:),X_2r(2,:),'X')

scatter (X_3r(1,:),X_3r(2,:), 'd')

title('test data')
axis equal

legend('class1_{test}','class2_{test}','class3_{test}','class1_{train}','class2_{train}','class3_{train}')

%%


