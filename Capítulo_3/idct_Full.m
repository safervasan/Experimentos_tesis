function B = idct_Full(A)

%Esta función calcula A dado L(A), donde L(A) = A x_3 U

% Referencia = Soto-Quiros, P., Valverde-Sanchez, S. y Chavarria-Zamora, L. C-Product Toolbox
%              – Version 1.0. Instituto Tecnol´ogico de Costa Rica, febrero 2025. Disponible en:
%              https://github.com/jusotoTEC/c-product-toolbox.

%Entradas: Tensor L(A) de tamaño m x n x p

%Salidas: A de tamaño m x n x p

% Función implementada por Pablo Soto-Quiros (jusoto@tec.ac.cr)
%                          Samuel Valverde-Sanchez (savalverde@itcr.ac.cr)
%                          Luis Chavarría Zamora (lachavarria@itcr.ac.cr)  

    [m,n,p]=size(A);
    Cp = dctmtx(p);
    W = diag(Cp(:,1));
    Z = diag(ones(p-1,1),1);
    M = W\(Cp*(eye(p)+Z));
    A_rsh=reshape(A,[],p);
    B_rsh = A_rsh/M';
    B = reshape(B_rsh,m,n,p);
end