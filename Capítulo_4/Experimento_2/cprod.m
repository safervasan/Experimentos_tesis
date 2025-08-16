
function C = cprod(A,B)

%Esta función se encarga de calcular el c-producto reducido de dos tensores tridimensionales

% Entradas: tensor A de tamaño m x n x p
%           tensor B de tamaño n x r x p

% Salidas: tensor C de tamaño m x r x p

    [m1,~,p] = size(A); %se extraen las dimensiones del tensor A.
    n2 = size(B,2); %se extrae el número de caras laterales de B.
    At = dct(A,[],3); %Calcula la DCT a A.
    Bt = dct(B,[],3); %Calcula la DCT a B.
    Ct = zeros(m1,n2,p); %Calcula un tensor de ceros
    for i=1:p
        Ct(:,:,i) = At(:,:,i) * Bt(:,:,i); %Calcula las caras frontales de CT
    end
    C = idct(Ct,[],3); %Calcula al tensor C.
end