clear 

close all

load spiral

% 
% Xplus=X(1:50,:);
% Xminus=X(51:100,:);
% 
% scatter(Xplus(:,1),Xplus(:,2));
% hold on;
% scatter(Xminus(:,1),Xminus(:,2));

% order of the polynom to be used
% this values was changed betwwen iterations
for i= 1:20
order = i;
%

SVM = svmtrain(X,Y,'kernel_function','polynomial','polyorder',order,'Method','QP','boxconstraint',10^4);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado j� vem em
% percentagem;
% nnz retornar o numnero de elementos que s�o zeros como estamos a negar a
% matriz vamos obeter os que s�o zeros, que correspondem a erros de
% classifica��o
erro_per(i) = nnz((RESULT - Y));

% quantos vectores de support s�o utilizados:
Nr_suport_vectors(i) = length(SVM.SupportVectors);

end
figure
plot(1:20,erro_per);
xlabel('polynomial order');
ylabel('percentual error');

%%
SVM = svmtrain(X,Y,'kernel_function','polynomial','polyorder',1,'ShowPlot',true,'Method','QP','boxconstraint',10^4);
% escolhemos o 6 pq � o de menor ordem que tem o menor erro


%%
%   P       error       N�svm
%   1       46%         100
%   10      0%          95
%   15      21%         93
%   5       16%         91
%   9       0%          96
%   11      2%          99
%   6       0           35
% valores pedidos 4.1
%
% parecem que quando o valor do polin�mio � par vai surgir uma linha de
% separa��o de classes fechada o valor do erro n�o varia substancialmente
% quando se aumenta a ordem, sendo que os primeiros s�o horriveis




% NOW LEGIT
% o n�mero de vectores de suporte para a cria��o do SVM � sempre
% elevado,sendo que para o caso polinomial vai ser dificil conseguir
% adaptar limites sem usar muito vectores de suporte
% logo n�o sei o que dizer, isto � aborrecido hi, how are u
% 
% o existe uma janela de graus do polinomio que causa que os valor do erro
% seja mais baixo, sendo que neste caso cria 

%%

clear 

close all

load spiral


% order of the polynom to be used
% this values was changed between iterations

for i=1:200
sigma = 0.1*i;

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'Method','QP','boxconstraint',10^4);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado j� vem em
% percentagem;
% nnz retornar o numnero de elementos que s�o zeros como estamos a negar a
% matriz vamos obeter os que s�o zeros, que correspondem a erros de
% classifica��o
erro_per(i) = nnz((RESULT - Y));

% quantos vectores de support s�o utilizados:
Nr_suport_vectors(i) = length(SVM.SupportVectors);
end


% quanto menor o sgima vais vectores usa sendo que vai fazer um contorno
% mais elaborado em torno de cada vector, sendo utilizados todos os vectores como vectores de suporte pois nestas situa��es 
% o agloritmo vai tentar considerar cada um dos vectores como individual, fazendo que n�o exista erro nos vectores de treina no entanto muito pouco flexivel
% mais concretamente ocorre overfitting. � medida que se vai aumentado o
% simga consegue-se notar que se vai criando uma �rea que engloba os
% datassets , sendo cada vez menos rigida at� a um ponto em que come�a a
% englobar pontos pertencentes ao outro (sinal)

% Como existiam v�rios valores em que o erro � o nos escolhemos o valor de
% sigma para o qual eram utilizados menos vectores de suporte 
%

figure
plot(0.01:0.01:2,erro_per)
xlabel('sigma');
ylabel('percentual error');

figure
plot(0.01:0.01:2,Nr_suport_vectors)
xlabel('sigma');
ylabel('suport vectires');
%%
SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',0.89,'ShowPlot',true,'Method','QP','boxconstraint',10^4);


%%
close all
load Chess33
sigma = 1;


for i=1:200
sigma = 0.02*i;
SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'Method','QP','boxconstraint',Inf);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado j� vem em
% percentagem;
% nnz retornar o numnero de elementos que s�o zeros como estamos a negar a
% matriz vamos obeter os que s�o zeros, que correspondem a erros de
% classifica��o
erro_per(i) = nnz((RESULT - Y));

% quantos vectores de support s�o utilizados:
Nr_suport_vectors(i) = length(SVM.SupportVectors);
end

plot(0.02:0.02:4,erro_per);
[minimo,local] = min (Nr_suport_vectors);
sigma_res = local * 0.02
figure
plot(0.02:0.02:4,Nr_suport_vectors);
%sigma -> vectors
% mas parece que deve ser possivel retirar mais um vector
%01 -> 10
%2 -> 10
%1.5 -> 15


% 2.38 valor mais alto com 10, no entanto n�o se consegue correr o que vem
% asseguir
%%
close all
load Chess33n
sigma = 1;

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',Inf);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado j� vem em
% percentagem;
% nnz retornar o numnero de elementos que s�o zeros como estamos a negar a
% matriz vamos obeter os que s�o zeros, que correspondem a erros de
% classifica��o
erro_per = nnz((RESULT - Y))

% quantos vectores de support s�o utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)

%erro 0 nr = 17 
% em vez de fazer uma bolsa individual para cada um dos cluster de dados
% pertencentes � mesma classe criou bubbles em volta de um dos outleirs





%%
close all
load Chess33n
sigma = 1;
stuff = 1;
for stuff = 10:-1:-10
box = 10^stuff;
stuff

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',box);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado j� vem em
% percentagem;
% nnz retornar o numnero de elementos que s�o zeros como estamos a negar a
% matriz vamos obeter os que s�o zeros, que correspondem a erros de
% classifica��o
erro_per = nnz((RESULT - Y))
pause()
% quantos vectores de support s�o utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)
end


%% -5

% errp de 40% n�o consigo ver as linhas 90 sv

%bolsa que engloba os verdes e os vermelhos que se encontram � volta

% igual

% igual

% igual a linha do lado esquerdo passa para fora do ecra agr

% corta a bolha para englobar o conjunto de vermelhos que se encontra no
% meio acho que � aqui o valor que eles devem queres 

% duas bolahs para os verdes

% 

% cria uma bolsa no meio so para os vermelhos

%...

% 8 bolha para todos os outliers

%continua igual
