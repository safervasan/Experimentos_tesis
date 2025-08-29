
function [duracion, pseudoinversa, iteraciones, errores_c] = cpseudoinv(A,iterMax,s,tol)

% Esta función determina el tiempo de ejecución y la pseudoinversa
% tensorial

% Entradas: tensor A de tamaño m x n x p
%           Cantidad máxima de iteraciones (iterMax)
%           Valor de convergencia (s)
%           Tolerancia (tol)

% Salidas: tiempo de ejecución (duración)
%          Estimación de la pseudoinversa tensorial (pseudoinversa)
%          Número de iteraciones (iteraciones)
%          Lista de errores generada en la ejecución del algoritmo.

    tic;
    [~, m, p] = size(A);
    I = c_identidad(m,p);
    Ac = c_traspuesta(A);
    alpha = c_norma2(Ac); 
    X = (1/alpha^2)*Ac;
    lista = [];
    errores = [];
    for k = 1:iterMax
        lista(k) = k;
        X = formula_iterativa(X,A,s);
        er = c_norma2(cprod(A,X)-I);
        errores(k) = er;
        if er < tol
            break
        end
    end    
    pseudoinversa = X;
    duracion = toc;
    iteraciones = lista;
    errores_c = errores;
end