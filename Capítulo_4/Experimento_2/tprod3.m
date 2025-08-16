
function X = tprod3(A,B,C)

% Esta función calcula el t-producto de tres tensores de tercer orden

% Entradas: tensor A de tamaño m x n x p
%           tensor B de tamapo n x r x p
%           tensor C de tamaño r x s x p

% Salidas: tensor C de tamaño m x s x p

    Y = tprod(A,B);
    X = tprod(Y,C);
end
