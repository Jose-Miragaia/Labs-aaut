%matriz adaptada para 1D data

function  [erro,beta] = matrizfazer(p,X,Y)
      n = size (X,1);
      a = ones (n,p+1);
      
      for (i=2:p+1)
        a(:,i) = X(:,1).^(i-1);
      end
      
       beta = a\Y;
       figure
       hold on
       
       scatter(X,Y)
       t= min(X):1E-3:max(X);
%        a = size(t);
%        for j=1:a(2)
%             FUNC(j) = 0;
%            end
%        
%        for i=1:p+1    
%            for j=1:a(2)
%             FUNC(j) = FUNC(j) + beta(i)*t(j)^(i-1);
%            end
%        end
       
       plot (t,funcaomagica(beta,t))
    
       erro =0;
       
        for i=1:n
             erro = erro + ((Y(i) - funcaomagica(beta,X(i)))^2);
        end
        
        erro
        beta
       
end


 function output = funcaomagica(beta,x)
    output=0;
    for i=1:size(beta) 
         output=output+beta(i)*x.^(i-1);
    end
 end