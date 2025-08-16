
function [iteraciones,errores,duracion] = cpseudo2(m,n,p,tol,s,MaxIter)

% Esta función determina una sucesión de iteraciones, una sucesión de
% errores por iteración y la duración al estimar la pseudoinversa de un
% tensor de tercer orden

% Entradas: número de caras laterales (m)
%           número de caras horizontales (n)
%           número de caras frontales (p)
%           Tolerancia (tol)
%           Valor de convergencia (s)
%           Cantidad máxima de iteraciones (MaxIter)

% Salidas: sucesión de iteraciones (iteraciones)
%          sucesión de errores (errores)
%          Tiempo de ejecución (duración)

    
    tic;
    A = randn(m,n,p); %Se establece el tensor A.
    %Cálculo de la condición inicial
    B = c_traspuesta(A);
    alpha = c_norma2(A);
    X = (1/alpha^2)*B;
    er = []; %lista vacía de errores
    lista = []; %lista vacía de iteraciones    
    for k = 1:MaxIter
        lista(k) = k; %Llena la lista lista.
        X = formula_iterativa(X,A,s); %Estima la pseudoinversa.
        er = [er,c_norma2(cprod(cprod(A,X),A)-A)]; %llena el vector de errores.
        if c_norma2(cprod(cprod(A,X),A)-A) < tol
            break
        end
    end
    duracion=toc;
    iteraciones = lista;
    errores = er;
end