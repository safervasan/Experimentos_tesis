%Esta función crea un tensor identidad bajo el c-producto.

function I = c_identidad(n,p)
    It = zeros(n,n,p); %Crea un tensor de ceros
    for k = 1:p
        It(:,:,k) = eye(n); %A cada cara frontal asigna una matriz identidad.
    end    
    I = idct(It,[],3); %Determina el tensor identidad bajo el c-producto
end