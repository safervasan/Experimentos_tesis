%Esta función permite calcular el c-producto de tres tensores de tercer orden
%Esta función emplea la función cprod(A,B).

function X = cprod_3tensores(A,B,C)
    Y = cprod(A,B);
    X = cprod(Y,C);
end