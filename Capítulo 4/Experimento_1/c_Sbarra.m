
function St = c_Sbarra(A)

%Esta función calcula el tensor Sbarra al realizar la descomposición en
%valores singulares del tensor A, bajo el cproducto reducido.

% Entradas: tensor A de tamaño m x n x p

% Salidas: tensor S_barra de tamaño m x n x p

    p = size(A,3); %Extrae la cantidad de caras frontales de A.
    At = dct(A,[],3); 
    for i = 1:p
        [~,St(:,:,i),~] = svd(At(:,:,i)); %Calcula el tensor S (barra) de A (barra).
    end	     
end