
function [iteraciones,errores,duracion] = cpseudo2(m,n,p,tol,s,MaxIter)

% Esta función permite determinar una sucesión de iteraciones, sucesión
% errores asociada a la sucesión de iteraciones y duración al estimar la
% pseudoinvesa de un tensor mediante el c-producto reducido.

% Entradas: caras laterales de un tensor (m)
%           caras frontales de un tensor (n)
%           caras horizontales de un tensor (p)
%           Tolerancia (tol)
%           Valor de convergencia (s)
%           Cantidad máxima de iteraciones (MaxIter)
    
% Salidas: Sucesión de iteraciones (iteraciones)
%          Sucesión de errores asociada a la sucesión de iteraciones
%          (errores)
%          Tiempo de ejecución (duración)

    tic;
    I = c_identidad(m,p);
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
        er = [er,c_norma2(cprod(A,X)-I)]; %llena el vector de errores.
        if c_norma2(cprod(A,X)-I) < tol
            break
        end
    end
    duracion=toc;
    iteraciones = lista;
    errores = er;
end