
function I=tEye(m,s)

% Esta función determina un tensor identidad de tamaño m x m x s

% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%                        of complete full-rank third-order tensors based on the T-product, Results in Applied
%                        Mathematics, vol. 18, p. 100372, 2023.

% Entradas: número de caras laterales y horizontales (m)
%           número de caras frontales (s)
    
    I=zeros(m,m,s);
    I(:,:,1)=eye(m);
    
end