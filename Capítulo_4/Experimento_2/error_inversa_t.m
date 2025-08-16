
function e = error_inversa_t(A,B,inv)

%%Esta función calcula el error de estimar A^(-1), al resolver el sistema A*X =B
%A, B e inv(pseudoinversa) son dadas.

% Entradas: tensor A de tamaño m x m x p
%           tensor B de tamaño m x 1 x p
%           tensor inv de tamaño m x m x p

% Salidas: error de estimación (e)

    X = tprod(inv,B);
    e = tFrobNorm(tprod(A,X)-B);
end