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
order = 12;
%%

SVM = svmtrain(X,Y,'kernel_function','polynomial','polyorder',order,'ShowPlot',true,'Method','QP','boxconstraint',10^4);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per = nnz((RESULT - Y))

% quantos vectores de support são utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)

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
sigma = 1;
%%

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',10^4);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per = nnz((RESULT - Y))

% quantos vectores de support são utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)



% quanto menor o sgima vais vectores usa sendo que vai fazer um contorno
% mais elaborado e uniforme ao longo de todos os vectores de suporte



%%
close all
load Chess33
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



%sigma -> vectors
% mas parece que deve ser possivel retirar mais um vector
%01 -> 10
%2 -> 10
%1.5 -> 15
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
box = 10^stuff;

SVM = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sigma,'ShowPlot',true,'Method','QP','boxconstraint',box);

RESULT = svmclassify(SVM,X);

% erro em percentagem , como existem 100 elementos o resultado já vem em
% percentagem;
% nnz retornar o numnero de elementos que são zeros como estamos a negar a
% matriz vamos obeter os que são zeros, que correspondem a erros de
% classificação
erro_per = nnz((RESULT - Y))

% quantos vectores de support são utilizados:
Nr_suport_vectors = length(SVM.SupportVectors)