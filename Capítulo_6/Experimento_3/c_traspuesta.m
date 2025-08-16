%Esta función calcula la conjugada traspuesta de un tensor tridimensional bajo el c-producto

function C = c_traspuesta(A)
    [m,n,p] = size(A); %extrae las dimensiones de A.   
    At = dct(A,[],3); %Calcula la dct a A.
    Ct = zeros(n,m,p); %Genera un tensor nulo.
    for i=1:p
        Ct(:,:,i) = (At(:,:,i)).'; %Calcula la traspuesta a cada una de las caras frontales de At.
    end
    C = idct(Ct,[],3); %Calcula C, teniendo C(barra).
end