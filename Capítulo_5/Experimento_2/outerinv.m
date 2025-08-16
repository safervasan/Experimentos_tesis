
function [qr_pseudo,duracion] = outerinv(A)

% Esta función permite estimar la pseudoinversa/inversa de un tensor
% tridimensional

% Referencias: R. Behera, K. Panigrahy, J. K. Sahoo y Y. Wei, 𝑀-QR decomposition and hyperpower
%              iterative methods for computing outer inverses of tensors, arXiv preprint
%              arXiv:2409.07007, 2024.

% Entradas: tensor A de tamaño m x n x p

% Salidas: tensor qr_pseudo de tamaño n x m x p
%          Tiempo de ejecución (duración)

% Función implementada por Samuel Valverde Sánchez

    tic;
    [m,n,p] = size(A);
    W = c_traspuesta(A);
    s = rank(mat_barra(W))/p;
    [Q,P,R] = M_QR(W);
    mat_Q = mat_barra(Q); mat_R = mat_barra(R);
    Q1 = mat_Q(:,1:s*p); R1 = mat_R(1:s*p,:);
    Qbarra = mat_barra_inv(Q1,n,s,p);
    Rbarra = mat_barra_inv(R1,s,m,p);
    Y = cprod_4tensores(Rbarra,c_traspuesta(P),A,Qbarra);
    Z = cprod_4tensores(c_traspuesta(Qbarra),W,A,Qbarra);
    Ly = dct(Y,[],3); Lz = dct(Z,[],3);
    for i=1:p
        Yc(:,:,i) = inv(Ly(:,:,i));
        Zc(:,:,i) = inv(Lz(:,:,i));
    end
    X1 = idct(Yc,[],3); X2 = idct(Zc,[],3);
    qr_pseudo = cprod_4tensores(Qbarra,X1,Rbarra,c_traspuesta(P));
    duracion = toc;
end