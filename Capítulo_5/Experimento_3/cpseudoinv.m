
function [duracion, inversa] = cpseudoinv(A,iterMax,s,tol)

% Esta función determina el tiempo de ejecución y la pseudoinversa
% tensorial

% Entradas: tensor A de tamaño m x n x p
%           Cantidad máxima de iteraciones (iterMax)
%           Valor de convergencia (s)
%           Tolerancia (tol)

% Salidas: tiempo de ejecución (duración)
%          Estimación de la pseudoinversa tensorial (pseudoinversa)

    tic;
    Ac = c_traspuesta(A);
    alpha = c_norma2(Ac); 
    X = (1/alpha^2)*Ac;    
    for k = 1:iterMax
        X = formula_iterativa(X,A,s);
        er = c_norma2(cprod(cprod(A,X),A)-A);
        if er < tol
            break
        end
    end    
    inversa = X;
    duracion = toc;
end