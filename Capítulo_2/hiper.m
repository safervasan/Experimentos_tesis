
function [lista1, errores1, pseudoinversa] = hiper(A,m, tol)

%Este método permite estimar la pseudoinversa matricial mediante el método
%de hiperpotencias.

% Referencia = M. D. Petković, P. S. Stanimirović y V. N. Katsikis, Modified discrete iterations for
%              computing the inverse and pseudoinverse of the time-varying matrix, Neurocomputing,
%              vol. 289, pp. 155-165, 2018.

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
    X = B*(eye(m)+(eye(m)-A*B)+(eye(m)-A*B)^2+(eye(m)-A*B)^3+(eye(m)-A*B)^4+(eye(m)-A*B)^5); %va calculando la pseudoinversa.
    B=X;
    i = i+1;
end
lista1 = lista;
errores1 = errores;
pseudoinversa = B;
end