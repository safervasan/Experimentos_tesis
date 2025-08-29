
function [X,Y,duracion, error_cong, it_cong] = conjugate_gradient(A, MaxIter,tol)

% Esta función permite estimar la pseudoinvers tensorial al determinar el
% tensor X.

% Referencias: B. Huang, Conjugate gradient-type method for the tensor linear system via the Tproduct
%              and its application in the calculation of Moore-Penrose inverse, Applied
%              Mathematics and Computation, vol. 472, p. 128627, 2024.

% Entradas: tensor A de tamaño m x n x p.
%           Cantidad máxima de iteraciones (MaxIter)
%           Tolerancia (tol)

% Salidas: X de tamaño n x m x p
%          Y de tamaño m x n x p
%          Tiempo de ejecución (duración)
%          Lista de errores por iteración.
%          Lista de iteraciones.

%Función implementada por Samuel Valverde Sánchez

    tic;
    [m,n,p] = size(A);
    errores = [];
    lista = [];
    X0 = zeros(n,m,p); Y0 = zeros(m,n,p);
    AT = tCTranspose(A);
    R0_1 = A - tprod3(A,X0,A); R0_2 = -X0 + tprod3(AT,Y0,AT);
    P0_1 = tprod3(AT,R0_1,AT)+R0_2; P0_2 = -tprod3(A,R0_2,A);
    Q0_1 = P0_1; Q0_2 = P0_2;
    k = 0;
    while k < MaxIter
        lista(k+1) = k+1;
        ak = (tNorm2(R0_1)^2 + tNorm2(R0_2)^2)/(tNorm2(Q0_1)^2 + tNorm2(Q0_2)^2);
        X = X0 + ak*Q0_1;
        Y = Y0 + ak*Q0_2;
        R1_1 = A - tprod3(A,X,A);
        R1_2 = -X + tprod3(AT,Y,AT);
        er = tNorm2(R1_1)^2 + tNorm2(R1_2)^2;
        errores(k+1) = er;
        if tNorm2(R1_1)^2 + tNorm2(R1_2)^2 < tol
            break
        end
        P1_1 = tprod3(AT,R1_1,AT)+R1_2;
        P1_2 = -tprod3(A,R1_2,A);
        bk = (tNorm2(R1_1)^2 + tNorm2(R1_2)^2)/(tNorm2(R0_1)^2 + tNorm2(R0_2)^2);
        Q1_1 = P1_1 + bk*Q0_1; 
        Q1_2 = P1_2 + bk*Q0_2;
        R0_1 = R1_1; R0_2 = R1_2; Q0_1 = Q1_1; Q0_2 = Q1_2; X0 = X; Y0 = Y;
        k = k+1;
    end 
    duracion = toc;
    error_cong = errores;
    it_cong = lista;
end