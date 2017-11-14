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

for i=1:length(ytrain)
    switch ytrain(i);
        case 1
            X_1(:,k) =  xtrain(:,i);
            k=k+1;
        case 2
            X_2(:,j) =  xtrain(:,i);
            j=j+1;
        case 3
            X_3 (:,m)=  xtrain(:,i);
            m=m+1;
    end
end


figure  
hold on

axis equal

scatter (X_1(1,:),X_1(2,:))

scatter (X_2(1,:),X_2(2,:),'X')

scatter (X_3(1,:),X_3(2,:), 'd')


title('test data')


legend('class_1','class_2','class_3')