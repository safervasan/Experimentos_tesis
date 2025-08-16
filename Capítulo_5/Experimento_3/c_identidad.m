
function I = c_identidad(n,p)

%Esta función crea un tensor identidad bajo el c-producto reducido

% Entradas: número de caras laterales y horizontales (n)
%           número de caras frontales

% Salidas: tensor I de tamaño n x n x p

    It = zeros(n,n,p); %Crea un tensor de ceros
    for k = 1:p
        It(:,:,k) = eye(n); %A cada cara frontal asigna una matriz identidad.
    end    
    I = idct(It,[],3); %Determina el tensor identidad bajo el c-producto
end