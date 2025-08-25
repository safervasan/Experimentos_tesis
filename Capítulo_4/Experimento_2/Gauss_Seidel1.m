
function [X, duracion, iteraciones, errores_gaus] = Gauss_Seidel1(A, B, k, tol)

% Esta función brinda una estimación al sistema multilineal A*X = B

% Referencias: J. K. Sahoo, S. K. Panda, R. Behera y P. S. Stanimirović, “Computation of tensors
%              generalized inverses under M-product and applications”, Journal of Mathematical
%              Analysis and Applications, vol. 542, núm. 1, p. 128864, 2025.

% Entradas: tensor A de tamaño m x m x p
%           tensor B de tamaño m x 1 x p
%           cantidad máxima de iteraciones (k)
%           Tolerancia (k)

% Salidas: tensor X de tamaño m x 1 x p
%          Tiempo de ejecución (duración)

% Función implementada por Samuel Valverde Sánchez

    tic;
    At = dct(A,[],3);
    %Tt = At/(2*c_norma2(At));
    p = size(A,3);
    lista = [];
    errores = [];
    for i = 1:p
        Dt=diag(diag(At(:,:,i)));
        Lt(:,:,i) = tril(At(:,:,i))-Dt;
        Ut(:,:,i) = At(:,:,i) -Lt(:,:,i) - Dt;
        Tt(:,:,i) = mldivide(Lt(:,:,i)+Dt,-Ut(:,:,i));
        C(:,1,i) = mldivide(Lt(:,:,i)+Dt,B(:,1,i));
        X0(:,1,i) = zeros(size(A,1),1);
        for j = 1:k
            lista(j) = j;
            Xt(:,1,i) = Tt(:,:,i)*X0(:,1,i) + C(:,1,i);
            erk = c_norma2(Xt(:,1,i) - X0(:,1,i));
            errores(j) = erk;
            if erk <= tol
                break
            end
            X0(:,1,i) = Xt(:,1,i);
        end
    end
    X = idct(Xt,[],3);
    duracion = toc;
    iteraciones = lista;
    errores_gaus = errores;
end
