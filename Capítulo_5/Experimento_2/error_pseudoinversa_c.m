
function e = error_pseudoinversa_c(A,pseudoinversa)

% Esta función calcula el error al estimar la pseudoinversa

% Entradas: tensor A de tamaño m x n x p
%           tensor pseudoinversa de tamaño m x n x p

% Salidas: error de estimación (e)

    e = tFrobNorm(cprod_3tensores(A,pseudoinversa,A)-A);
end