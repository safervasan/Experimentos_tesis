function [lista1, errores1, pseudoinversa] = Li(A,m, tol)

%Esta función permite estimar la pseudoinversa matricial mediante el método
%de Li y Li solamente para s = 4

% Referencia: Li, W. y Li, Z. A family of iterative methods for computing the approximate inverse
%             of a square matrix and inner inverse of a non-square matrix. Applied Mathematics
%             and Computation, vol. 215, no. 9, pp. 3433–3442, 2010.

%Entradas: Matriz A
%          Número de filas de A (m).
%          Tolerancia (tol)

%Salidas: Sucesión de iteraciones (lista 1)
%         Sucesión de errores por iteración (iteraciones 1)
%         Pseudoinversa matricial (pseudoinversa)

% Función implementada por Samuel Valverde Sánchez

B = (1/norm(A)^2)*A'; %Condición inicial, corresponde a X_0.
i = 1; %llevará el conteo del número de iteraciones.
lista = []; %lista con el número de iteraciones realizadas.
errores = []; %lista de errores de aproximación de la matriz X_{k+1} con su pseudoinversa.
while norm(A*B*A-A)>tol %condición de parada.
    errores = [errores,norm(A*B*A-A)]; 
    lista(i)=i;
    X = B*(4*eye(m) - 6*(A*B) + 4*(A*B)^2 - (A*B)^3); %va calculando la pseudoinversa.
    B = X;
    i = i+1;
end
lista1 = lista;
errores1 = errores;
pseudoinversa = B;
end
