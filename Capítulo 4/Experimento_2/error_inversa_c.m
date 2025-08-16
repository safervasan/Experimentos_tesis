
function e = error_inversa_c(A,B,inv)

% Esta función calcula el error al estimar la inversa matricial al resolver
% el sistema multilineal A*X = B

% Entradas: tensor A de tamaño m x m x p
%           tensor B de tamaño m x 1 x p
%           tensor inv de tamaño m x m x p

% Salidas: error de estimación (e)

    X = cprod(inv,B);
    e = tFrobNorm(cprod(A,X)-B);
end