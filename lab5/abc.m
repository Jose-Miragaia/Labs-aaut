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
%%

SVM = svmtrain(X,Y,'kernel_function','polynomial','polyorder',order,'ShowPlot',true,'Method','QP','boxconstraint',10^4);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per(i) = nnz((RESULT - Y))

% quantos vectores de support são utilizados:
Nr_suport_vectors(i) = length(SVM.SupportVectors);

end
figure
plot(1:20,erro_per);

%%
%   P       error       Nºsvm
%   1       46%         100
%   10      0%          95
%   15      21%         93
%   5       16%         91
%   9       0%          96
%   11      2%          99
% valores pedidos 4.1
%
% parecem que quando o valor do polinómio é par vai surgir uma linha de
% separação de classes fechada o valor do erro não varia substancialmente
% quando se aumenta a ordem, sendo que os primeiros são horriveis
%%

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

for i=1:200
sigma = 0.01*i

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',10^4);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per(i) = nnz((RESULT - Y));

% quantos vectores de support são utilizados:
Nr_suport_vectors(i) = length(SVM.SupportVectors);
end


% quanto menor o sgima vais vectores usa sendo que vai fazer um contorno
% mais elaborado e uniforme ao longo de todos os vectores de suporte
plot(0.01:0.01:2,erro_per)


%%
close all
load Chess33
sigma = 1;


for i=1:200
sigma = 0.02*i;
SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'Method','QP','boxconstraint',Inf);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per(i) = nnz((RESULT - Y));

% quantos vectores de support são utilizados:
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


% 2.38 valor mais alto com 10, no entanto não se consegue correr o que vem
% asseguir
%%
close all
load Chess33n
sigma = 1;

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',Inf);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per = nnz((RESULT - Y))

% quantos vectores de support são utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)

%erro 0 nr = 17 
% em vez de fazer uma bolsa individual para cada um dos cluster de dados
% pertencentes à mesma classe 
% criou bubbles em volta de um dos outleirs
% sry for not writting more not rly in the mood




%%
close all
load Chess33n
sigma = 1;
stuff = 1;
for stuff = -5:10
box = 10^stuff;
stuff

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',box);
pause
RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per = nnz((RESULT - Y))

% quantos vectores de support são utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)
end


%% -5

% errp de 40% não consigo ver as linhas 90 sv

%bolsa que engloba os verdes e os vermelhos que se encontram à volta

% igual

% igual

% igual a linha do lado esquerdo passa para fora do ecra agr

% corta a bolha para englobar o conjunto de vermelhos que se encontra no
% meio acho que é aqui o valor que eles devem queres 

% duas bolahs para os verdes

% 

% cria uma bolsa no meio so para os vermelhos

%...

% 8 bolha para todos os outliers

%continua igual
