function B = idct_Full(A)
    [m,n,p]=size(A);
    Cp = dctmtx(p);
    W = diag(Cp(:,1));
    Z = diag(ones(p-1,1),1);
    M = W\(Cp*(eye(p)+Z));
    A_rsh=reshape(A,[],p);
    B_rsh = A_rsh/M';
    B = reshape(B_rsh,m,n,p);
end