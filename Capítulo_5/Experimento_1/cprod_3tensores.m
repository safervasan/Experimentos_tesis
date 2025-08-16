
function X = cprod_3tensores(A,B,C)

%Esta función permite calcular el c-producto reducido de tres tensores de tercer orden
%Esta función emplea la función cprod(A,B).

% Entradas: tensor A de tamaño m x n x p
%           tensor B de tamaño n x r x p
%           tensor C de tamaño r x s x p

% Salidas: tensor X de tamaño m x s x p

    Y = cprod(A,B);
    X = cprod(Y,C);
end
