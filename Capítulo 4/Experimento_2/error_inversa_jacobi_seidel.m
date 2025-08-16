
function e = error_inversa_jacobi_seidel(A,B,X)

%Esta función determina el error al obtener X para resolver el sistema A*X = B.
%A, X y B son dados.

% Entradas: tensor A de tamaño m x m x p
%           tensor B de tamaño m x 1 x p
%           tensor X de tamaño m x 1 x p

% Salida: error de estimación (e)

    B1 = cprod(A,X);
    e = tFrobNorm(B1-B);
end