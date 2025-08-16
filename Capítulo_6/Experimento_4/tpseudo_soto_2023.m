function pseudo = tpseudo_soto_2023(A,iterMax,s,tol)
    [m,n,~] = size(A);
    if m==n    
        % Initial Value
        At=tCTranspose(A);
        alpha=tNorm2(At); X=(1/alpha^2)*At;
        % Iterative Methods
        for k=1:iterMax
            X=formulaIterative(X,A,s);
            if tNorm2(tprod(tprod(A,X),A)-A)<tol
                break
            end
        end
        pseudo = X;  
            
    elseif m<n
        
        % Initial Value
        At=tCTranspose(A); AAt=tprod(A,At);
        alpha=tNorm2(AAt); X=(1/alpha^2)*AAt;
        % Iterative Methods
        for k=1:iterMax
            X=formulaIterative(X,AAt,s);
            S=tprod(At,X);    
            if tNorm2(tprod(tprod(A,S),A)-A)<tol
                break
            end        
        end
        pseudo = S;
        % Results
        %disp(['Iterative method of order s = ', num2str(s)])
        %disp(['Iterations k = ', num2str(k)])
        %disp(['Error = ', num2str(er)])
        %disp(['Time (s) = ', num2str(t)])
    
    elseif m>n  
        
        % Initial Value
        At=tCTranspose(A); AtA=tprod(At,A);
        alpha=tNorm2(AtA); X=(1/alpha^2)*AtA;
        % Iterative Methods
        for k=1:iterMax
            X=formulaIterative(X,AtA,s);
            S=tprod(X,At);
            if tNorm2(tprod(tprod(A,S),A)-A)<tol
                break
            end        
        end
        pseudo = S;
    end
end