
function [lista1, errores1, pseudoinversa] = chev(A,m, tol)

%Esta función permite estimar la pseudoinversa matricial mediante el método
%de Chebyshev

% Referencia: M. Z. Ullah, F. Soleymani y A. S. Al-Fhaid, An efficient matrix iteration for computing
%             weighted Moore–Penrose inverse, Applied Mathematics and Computation, vol.
%             226, pp. 441–454, 2014.

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
    X = B*(3*eye(m)-3*A*B+(A*B)^2); %va calculando la pseudoinversa.
    B=X;
    i = i+1;
end
lista1 = lista;
errores1 = errores;
pseudoinversa = B;
end
