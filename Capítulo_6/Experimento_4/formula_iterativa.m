function Z = formula_iterativa(X,A,s)
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