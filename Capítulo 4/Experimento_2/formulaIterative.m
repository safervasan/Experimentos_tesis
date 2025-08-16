
function Z = formulaIterative(X,A,s)

% Esta función permite calcular la pseudoinversa de un tensor bajo el
% t-producto al fijar un valor de convergencia específico.

% Referencias: P. Soto, Convergence analysis of iterative methods for computing the T-pseudoinverse
%              of complete full-rank third-order tensors based on the T-product, Results in Applied
%              Mathematics, vol. 18, p. 100372, 2023.

% Entradas: tensor A de tamaño m x n x p.
%           tensor X de tamaño n x m x p (condición inicial)
%           Valor de convergencia (s)

% Salidas: pseudoinversa (Z de tamaño n x m x p)

    m=size(A,1); p=size(A,3);
    Aux=tEye(m,p);
    S=nchoosek(s,1)*Aux;
    ApX=tprod(A,X);
    for r=2:s
        const=(-1)^(r-1)*nchoosek(s,r);
        Aux=tprod(Aux,ApX);
        S=S+const*Aux;
    end
    Z=tprod(X,S);

end