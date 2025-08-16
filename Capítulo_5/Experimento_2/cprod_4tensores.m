
function Z = cprod_4tensores(A,B,C,D)

%Esta función permite calcular el c-producto de cuatro tensores de tercer orden
%Esta función emplea la función cprod(A,B).

% Entradas: tensor A de tamaño m x n x p
%           tensor B de tamaño n x r x p
%           tensor C de tamaño r x s x p
%           tensor D de tamaño s x t x p

% Salidas: tensor Z de tamaño m x t x p

    Y = cprod(A,B);
    X = cprod(Y,C);
    Z = cprod(X,D);
end