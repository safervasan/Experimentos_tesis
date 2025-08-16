
function x=tFrobNorm(A)

% Esta función determina la norma de frobenius de un tensor

% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%                        of complete full-rank third-order tensors based on the T-product, Results in Applied
%                        Mathematics, vol. 18, p. 100372, 2023.

% Entradas: tensor A de tamaño m x n x p

% Salidas: norma de Frobenius (x)

    s=size(A,3);
    x=0;
    for k=1:s
        x=x+norm(A(:,:,k),'fro')^2;
    end
    x=sqrt(x);

end