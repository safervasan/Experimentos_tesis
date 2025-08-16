
function maxi=tNorm2(A)

% Esta función calcula la norma espectral bajo el t-producto

% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%                        of complete full-rank third-order tensors based on the T-product, Results in Applied
%                        Mathematics, vol. 18, p. 100372, 2023.

% Entradas: tensor A de tamaño m x n x p

% Salidas: norma espectral (maxi)

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