
function I=tEye(m,s)

% Esta función determina un tensor identidad de tamaño m x m x s

% Entradas: número de caras laterales y horizontales (m)
%           número de caras frontales (s)

% Salidas. tensor I de tamaño m x m x s
    
    I=zeros(m,m,s);
    I(:,:,1)=eye(m);
    
end