
function [duracion, inversa, iteraciones, error_soto] = Soto2023(A,iterMax,s,tol)

% Esta función permite estimar la inversa de un tensor

% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%              of complete full-rank third-order tensors based on the T-product, Results in Applied
%              Mathematics, vol. 18, p. 100372, 2023.

% Entradas: tensor A de tamaño m x m x p
%           cantidad máxima de iteraciones (iterMax)
%           Valor de convergencia (s)
%           Tolerancia (tol)

% Salidas: tiempo de ejecución (duración)
%          Estimación de la inversa tensorial (inversa)
%          Número de iteraciones realizadas (iteraciones)
%          Sucesión de errores asociada a cada iteración.

% Función adaptada por Samuel Valverde Sánchez

    tic;
    At = tCTranspose(A);
    alpha = tNorm2(At); 
    X = (1/alpha^2)*At;
    lista = [];
    errores = [];
    for k = 1:iterMax
        lista(k) = k;
        X = formulaIterative(X,A,s);
        er = tNorm2(tprod(tprod(A,X),A)-A);
        errores(k) = er;
        if er < tol
            break
        end
    end    
    inversa = X;
    duracion = toc;
    iteraciones = lista;
    error_soto = errores;
end