
function Z = formula_iterativa(X,A,s)

% Esta función permite calcular la pseudoinversa de un tensor bajo el
% c-producto reducido al fijar un valor de convergencia específico.

% Entradas: tensor A de tamaño m x n x p.
%           tensor X de tamaño n x m x p (condición inicial)
%           Valor de convergencia (s)

% Salidas: pseudoinversa (Z de tamaño n x m x p)

    m = size(A,1); 
    p = size(A,3);
    Aux = c_identidad(m,p);
    S = nchoosek(s,1)*Aux;
    ApX = cprod(A,X);
    for r = 2 :s
        const = (-1)^(r-1)*nchoosek(s,r);
        Aux = cprod(Aux,ApX);
        S = S + const*Aux;
    end
    Z = cprod(X,S);
end