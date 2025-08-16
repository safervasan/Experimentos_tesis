
function [duracion, pseudoinversa] = cpseudoinv(A,iterMax,s,tol)

%Esta función estima la pseudoinversa de un tensor de tercer orden, el número de iteraciones y la duración en la ejecución

% Entradas: tensor A de tamaño m x n x p
%           cantidad máxima de iteraciones (iterMax)
%           valor de convergencia (s)
%           Tolerancia (tol)

% Salidas: duración en la estimación de la pseudoinversa (duración)
%          pseudoinversa de tamaño n x m x p

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
    pseudoinversa = X;
    duracion = toc;
end