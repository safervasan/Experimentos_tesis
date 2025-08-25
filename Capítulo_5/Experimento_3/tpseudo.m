
function [duracion, pseudoinversa, error_tp, it_soto] = tpseudo(A,s,iterMax,tol)

% Esta función permite estimar la inversa de un tensor
% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%              of complete full-rank third-order tensors based on the T-product, Results in Applied
%              Mathematics, vol. 18, p. 100372, 2023.

% Entradas: tensor A de tamaño m x m x p
%           cantidad máxima de iteraciones (iterMax)
%           Valor de convergencia (s)
%           Tolerancia (tol)

% Salidas: tiempo de ejecución (duración)
%          Estimación de la inversa tensorial (pseudoinversa)

    tic;
    [m,n,~] = size(A);
    errores = [];
    lista = [];
    if m==n    
        % Initial Value
        At=tCTranspose(A);
        alpha=tNorm2(At); X=(1/alpha^2)*At;
        for k=1:iterMax
            lista(k) = k;
            X=formulaIterative(X,A,s);
            er = tNorm2(tprod(tprod(A,X),A)-A);
            errores(k) = er;
            if tNorm2(tprod(tprod(A,X),A)-A)<tol
                break
            end
        end
        t=toc;
        pseudoinversa = X;
        error_tp = errores;
        it_soto = lista;
    elseif m<n
        At=tCTranspose(A); AAt=tprod(A,At);
        alpha=tNorm2(AAt); X=(1/alpha^2)*AAt;
        for k=1:iterMax
            lista(k) = k;
            X=formulaIterative(X,AAt,s);
            S=tprod(At,X);
            er = tNorm2(tprod(tprod(A,S),A)-A);
            errores(k) = er;
            if tNorm2(tprod(tprod(A,S),A)-A)<tol
                break
            end
        end
        t=toc;
        pseudoinversa = S;
        error_tp = errores;
        it_soto = lista;
    elseif m>n        
        At=tCTranspose(A); AtA=tprod(At,A);
        alpha=tNorm2(AtA); X=(1/alpha^2)*AtA;
        for k=1:iterMax
            lista(k) = k;
            X=formulaIterative(X,AtA,s);
            S=tprod(X,At);
            er = tNorm2(tprod(tprod(A,S),A)-A);
            errores(k) = er;
            if tNorm2(tprod(tprod(A,S),A)-A)<tol
                break
            end
        end
        t=toc;
        pseudoinversa = S;
        error_tp = errores;
        it_soto = lista;
    end
    duracion = t;
end