
function [lista1, errores1, pseudoinversa] = kaur(A,m, tol)

%Este método permite estimar la pseudoinversa matricial mediante el método
%de kaur.

% Referencia = M. Kaur, M. Kansal y S. Kumar, An efficient hyperpower iterative method for computing
%weighted MoorePenrose inverse, AIMS Mathematics, vol. 5, no. 3, pp. 1680-
%1692, 2020.

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
    X = B*(5*eye(m)-10*A*B+10*(A*B)^2-5*(A*B)^3+(A*B)^4); %va calculando la pseudoinversa.
    B=X;
    i = i+1;
end
lista1 = lista;
errores1 = errores;
pseudoinversa = B;
end
