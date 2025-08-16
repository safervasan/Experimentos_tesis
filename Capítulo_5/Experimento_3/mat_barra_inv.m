
function tensor = mat_barra_inv(bloques,m,n,p)

% Esta función crea un tensor dada una matriz diagonal por bloques

% Entradas: matriz diagonal por bloques (bloques)
%           número de caras laterales (m)
%           número de caras horizontales (n)
%           número de caras frontales (p)

% Salidas: tensor de tamaño m x n x p

    X = zeros(m,n,p);
    for k = 0:p-1
        X(:,:,k+1) = bloques(1+k*m:m+k*m,1+k*n:n+n*k);
    end
    tensor = idct(X,[],3);
end