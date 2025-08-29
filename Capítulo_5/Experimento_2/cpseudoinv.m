
function [pseudo, duracion, er_cp, it_cp] = cpseudoinv(A,iterMax,s,tol)

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
    error = [];
    lista = [];
    for k = 1:iterMax
        lista = [lista,k];
        X = formula_iterativa(X,A,s);
        error = [error,c_norma2(cprod(cprod(A,X),A)-A)];
        if c_norma2(cprod(cprod(A,X),A)-A) < tol
            break
        end
    end    
    duracion = toc;
    er_cp = error;
    it_cp = lista;
    pseudo = X;
end