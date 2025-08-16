function [Q,P,R] = M_QR(A)

% Esta función determina la descomposición QR de un tensor

% Entradas: tensor A de tamaño m x n x p

% Salidas: tensor Q de tamaño de m x m x p
%          tensor P de tamaño n x n x p
%          tensor R de tamaño m x n x p

    p = size(A,3);
    At = dct(A,[],3); %Calcula la DCT a A.
    for i=1:p
        [Qt(:,:,i), Rt(:,:,i), Pt(:,:,i)] = qr(At(:,:,i));
    end
    Q = idct(Qt,[],3); R = idct(Rt,[],3); P = idct(Pt,[],3);
end