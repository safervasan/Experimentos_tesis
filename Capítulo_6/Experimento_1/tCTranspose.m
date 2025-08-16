function Y=tCTranspose(X)

% Esta función calcula la conjugada traspuesta de un tensor bajo el %t-producto%

% Entradas: tensor X de tamaño m x n x p

% Salidas: tensor Y de tamaño n x m x p

    [m,n,s]=size(X);
    Y=zeros(n,m,s);
    Y(:,:,1)=(X(:,:,1))';
    
    for k=2:s
        Y(:,:,k)=(X(:,:,s-k+2))';
    end
    
end