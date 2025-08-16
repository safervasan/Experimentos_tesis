%Esta función se encarga de calcular el c-producto de dos tensores tridimensionales

function C = cprod(A,B)
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