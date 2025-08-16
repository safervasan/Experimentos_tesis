function [X,Y] = conjugate_gradient(A, MaxIter,tol)
    [m,n,p] = size(A);
    X0 = zeros(n,m,p); Y0 = zeros(m,n,p);
    AT = tCTranspose(A);
    R0_1 = A - tprod3(A,X0,A); R0_2 = -X0 + tprod3(AT,Y0,AT);
    P0_1 = tprod3(AT,R0_1,AT)+R0_2; P0_2 = -tprod3(A,R0_2,A);
    Q0_1 = P0_1; Q0_2 = P0_2;
    k = 0;
    while k < MaxIter
        ak = (tNorm2(R0_1)^2 + tNorm2(R0_2)^2)/(tNorm2(Q0_1)^2 + tNorm2(Q0_2)^2);
        X = X0 + ak*Q0_1;
        Y = Y0 + ak*Q0_2;
        R1_1 = A - tprod3(A,X,A);
        R1_2 = -X + tprod3(AT,Y,AT);
        
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
end