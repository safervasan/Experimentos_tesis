
function B = tensor_diagonal_dominante1(A)

% Esta función calcula un tensor diagonal dominante dado un tensor

% Entradas: tensor A de tamaño m x n x p

% Salidas: tensor B de tamaño m x n x p

    m = size(A,1); p = size(A,3);
    for j = 1:p
        for k = 1:m
            v1 = abs(A(k,:,j));
            num1 = sum(v1)+1;
            A(k,k,j) = num1;
        end
    end
    B = A;
end