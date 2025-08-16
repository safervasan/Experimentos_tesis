
function D = mat_barra(A)

% Esta función crea una matriz diagonal por bloques

% Entradas: tensor A de tamaño m x n x p

% Salidas matriz D de tamaño mp x np

    p = size(A,3);
    At = dct(A,[],3); %Calcula la DCT a A.
    frontales = cell(1,p);
    for i=1:p
        frontales{i} = At(:,:,i);
    end
    D = blkdiag(frontales{:});
end
