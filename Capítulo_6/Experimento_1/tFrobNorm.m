
function x=tFrobNorm(A)

% Esta función determina la norma de Frobenius de un tensor de tercer orden

% Entradas: tensor A de tamaño m x n x p

% Salidas: norma de Frobenius (x)

    s=size(A,3);
    x=0;
    for k=1:s
        x=x+norm(A(:,:,k),'fro')^2;
    end
    x=sqrt(x);

end