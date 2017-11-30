close all

Xmais=[1,1];
Xmenos=[-1 ,-1 ;-1,1;1,-1];



figure
scatter(Xmais(:,1),Xmais(:,2),'*','green');
hold on;
scatter(Xmenos(:,1),Xmenos(:,2),'+','red');
%
%SVM STUFF
scatter(Xmais(1,1),Xmais(1,2),'o','black');
scatter(Xmenos(2,1),Xmenos(2,2),'o','black');
scatter(Xmenos(3,1),Xmenos(3,2),'o','black');


%
x=-2:.2:2;
plot(x,-x,'blue');
plot(x,-x+2,'blue');
plot(x,-x+1,'black');

title('Input Space (AND)');
legend('+1','-1');
xlim([-2 2]);
ylim([-2 2]);
xlabel('x1');
ylabel('x2');


%%


close all

Xmais=[1,1;-1,-1];
Xmenos=[1 ,-1 ;-1,1];


figure
scatter(Xmais(:,1),Xmais(:,2),'*','green');
hold on;
scatter(Xmenos(:,1),Xmenos(:,2),'+','red');


title('Input Space (XOR)');
legend('+1','-1');
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
xlabel('x1');
ylabel('x2');


%
%% 

SVM STUFF
scatter(Xmais(1,1),Xmais(1,2),'o','black');
scatter(Xmenos(2,1),Xmenos(2,2),'o','black');
scatter(Xmenos(3,1),Xmenos(3,2),'o','black');


%
x=-2:.2:2;
plot(x,-x,'blue');
plot(x,-x+2,'blue');
plot(x,-x+1,'black');
%%

Xmais=[1,1,1;-1,-1,1];
Xmenos=[-1,1,-1;1,-1,-1]
figure
scatter3(Xmais(:,1),Xmais(:,2),Xmais(:,3),'*','green');
hold on;
scatter3(Xmenos(:,1),Xmenos(:,2),Xmenos(:,3),'+','red');

title('Feature Space (XOR)');
legend('+1','-1');


xlabel({'$\hat{x_1}$'},'Interpreter','latex');
ylabel({'$\hat{x_2}$'},'Interpreter','latex');
zlabel({'$\hat{x_3}$'},'Interpreter','latex');


%%



close all

Xmais=[1,1;-1,-1];
Xmenos=[1 ,-1 ;-1,1];


figure
scatter(Xmais(:,1),Xmais(:,2),'*','green');
hold on;
scatter(Xmenos(:,1),Xmenos(:,2),'+','red');


title('Input Space (XOR) with Margins and Frontier');

xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
xlabel('x1');
ylabel('x2');

scatter(Xmais(:,1),Xmais(:,2),'o','black');
scatter(Xmenos(:,1),Xmenos(:,2),'o','black');
legend('+1','-1','Support Vectors');
x=-1.5:.02:1.5;

 plot(x,1./x,'blue','LineStyle','--');
 plot(x,-1./x,'blue','LineStyle','--');
line([0, 0],[-1.5, 1.5],'Color','black')
line([-1.5, 1.5],[0, 0],'Color','black')