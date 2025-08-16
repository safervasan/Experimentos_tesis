function F = least_square_tensor_soto_2023(X,Y, iterMax, s, tol)
% F=least_square_tensor(X,Y) computes the solution of a least-squares 
% problem of a linear tensor equation F*Y=X of third-order
%
% Input:
%       X       -   m1*p*m3 tensor
%       Y       -   m1*p*m3 tensor
% Ouput:
%       F       -   m1*m1*p tensor F=X*Y^t, 
%                   where Y^t is the pseudoinverse Y
%
% References:
% Jin, H., Bai, M., Benítez, J., & Liu, X. (2017). 
% The generalized inverses of tensors and an application to linear models. 
% Computers & Mathematics with Applications, 74(3), 385-397.
%
% Written by Pablo Soto-Quiros (jusoto@tec.ac.cr)
    Yp = tpseudo_soto_2023(Y,iterMax,s,tol);
    F=tprod(X,Yp);    
end

