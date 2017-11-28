clear 

close all

load spiral


Xplus=X(1:50,:)
Xminus=X(51:100,:)

scatter(Xplus(:,1),Xplus(:,2));
hold on;
scatter(Xminus(:,1),Xminus(:,2));



abcdefghijklmnopqrstuvwxyz = svmtrain(X,Y,'kernel_function','polynomial','polyorder',10,'ShowPlot',true);

zyxwvutsrqponmlkjihgfedcba = svmclassify(abcdefghijklmnopqrstuvwxyz,X);



