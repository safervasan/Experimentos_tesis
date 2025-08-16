
function B = Matriz_diagonal_dominante(A)

% Esta función crea una matriz diagonal dominante a partir de la matriz A

% Entradas: matriz A de tamaño m x n

% Salidas: tensor B de tamaño m x n

    B = A;
    for i = 1:size(A,1)
        B(i,i) = sum(abs(B(i,:))) - abs(B(i,i)) + rand();  % Ajustar el elemento diagonal
    end
end