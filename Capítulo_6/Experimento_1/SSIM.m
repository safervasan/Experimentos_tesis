
function sim = SSIM(A,B)

% Esta función determina el valor SSIM al comparar una imagen reconstruida
% con la original

% Entradas: tensores A y B de tamaño m x n x p

% Salidas: valor SSIM (sim)

    sim = (1/3)*(ssim(A(:,:,1),B(:,:,1))+ssim(A(:,:,2),B(:,:,2))+ssim(A(:,:,3),B(:,:,3)));
end