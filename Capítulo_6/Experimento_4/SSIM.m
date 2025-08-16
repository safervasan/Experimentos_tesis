function sim = SSIM(A,B)
    p = size(A,3);
    sim = 0;
    for i = 1:p
        sim = sim + ssim(A(:,:,i),B(:,:,i));
    end
    sim = (1/p)*sim;
end