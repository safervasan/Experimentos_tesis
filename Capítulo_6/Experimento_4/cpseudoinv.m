%Esta función estima la pseudoinversa de un tensor de tercer orden, el número de iteraciones y la duración en la ejecución

function inversa = cpseudoinv(B,iterMax,s,tol)
    BBt=c_traspuesta(B);
    alpha=c_norma2(BBt);
    X=(1/alpha^2)*BBt;
    for k = 1:iterMax
        X = formula_iterativa(X,B,s); %Estima la pseudoinversa.
        e1 = c_norma2(cprod(cprod(B,X),B)-B);
        if e1 < tol
            break
        end
    end
    inversa = X;
end