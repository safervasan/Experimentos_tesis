
function Y=tCTranspose(X)

% Esta función calcula la traspuesta del tensor X.

% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%                        of complete full-rank third-order tensors based on the T-product, Results in Applied
%                        Mathematics, vol. 18, p. 100372, 2023.

% Entradas: tensor X de tamaño m x n x p

% Salidas: tensor Y de tamaño n x m x p

    [m,n,s]=size(X);
    Y=zeros(n,m,s);
    Y(:,:,1)=(X(:,:,1))';    
    for k=2:s
        Y(:,:,k)=(X(:,:,s-k+2))';
    end
    
end