
function maxi=tNorm2(A)

% Esta función determina la norma espectral de un tensor de tercer orden
% bajo el t-producto.

% Entradas: tensor A de tamaño m x n x p

% Salidas: norma espectral de un tensor (maxi)


    p=size(A,3);
    maxi=-1;
    At=fft(A,[],3);
    for k=1:p
        Sk=svd(At(:,:,k));
        SkMax=max(Sk);
        if SkMax>maxi
            maxi=SkMax;
        end
    end 
    
end