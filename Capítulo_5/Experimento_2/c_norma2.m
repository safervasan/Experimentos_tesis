
function max_sigma = c_norma2(A)

%Esta función calcula la norma 2 de un tensor bajo el c-producto reducido
%Esta función requiere de la función c_Sbarra.

% Entradas: tensor A de tamaño m x n x p

% Salidas: norma espectral de un tensor (max_sigma)

    p = size(A,3); %extrae el número de caras frontales
    sigma = zeros(1,p); %Genera un vector fila de ceros.
    Sbarra = c_Sbarra(A); %Determina el tensor S(barra) de la c-SVD de A tensor (barra)
    for i = 1:p
        sigma(i) = Sbarra(1,1,i); %se llena el vector con las entradas (1,1,i) de Sbarra.
    end
    max_sigma = max(sigma); %Calcula el valor más grande del vector sigma.
end