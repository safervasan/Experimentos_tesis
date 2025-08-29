
% Experimento 3: Reducción de ruido en base de datos con imágenes
%                a escala de grises
% Capítulo 6

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos
% Autor = Valverde-Sánchez, Samuel
% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all

%% Reducción de ruido en en base de datos a escala de grises
                 
% Parámetros iniciales
iterMax = 1000; tol = 1e-10; s = 10; 

% Lectura de algunas imágenes fuente
subplot(5,3,1)
imshow(imread('yesN\YN (1).jpg')); % Imagen 1
title('Imagen 1');
subplot(5,3,2)
imshow(imread('yesN\YN (77).jpg')); % Imagen 77
title('Imagen 77');
subplot(5,3,3)
imshow(imread('yesN\YN (154).jpg')); % Imagen 154
title('Imagen 154');

% Lectura de algunas imágenes con ruido
subplot(5,3,4)
imshow(imread('yesNR\YNR (1).jpg')); % Imagen 1 con ruido
title('Imagen 1 con ruido');
subplot(5,3,5)
imshow(imread('yesNR\YNR (77).jpg')); % Imagen 77 con ruido
title('Imagen 77 con ruido');
subplot(5,3,6)
imshow(imread('yesNR\YNR (154).jpg')); % Imagen 154 con ruido
title('Imagen 154 con ruido');

%Crear los tensores A y B sin ruido y con ruido, respectivamente
m = 173; n = 178; p = 154;
A = zeros(m, n, p);
B = zeros(m, n, p);
for i = 1:p
    text = ['yesN\YN (' num2str(i) ').jpg'];
    A(:,:,i) = im2gray(im2double(imread(text)));
    text1 = ['yesNR\YNR (' num2str(i) ').jpg'];
    B(:,:,i) = im2gray(im2double(imread(text1)));
end

% Eliminación de ruido con el Algoritmo 5
tic;
BBt = c_traspuesta(B);
alpha = c_norma2(BBt);
X = (1/alpha^2)*BBt;
for k = 1:iterMax
     X = formula_iterativa(X,B,s); %Estima la pseudoinversa.
     e1 = c_norma2(cprod(cprod(B,X),B)-B);
     if e1 < tol
         break
     end
end
% Reconstrucción de la imagen
F2 = cprod(A,X);
A_rec2 = cprod(F2,B);
Alg_4_toc = toc;
A_rec2 = im2double(A_rec2);
SSIM_alg_4 = SSIM(A,A_rec2);
error_alg_4 = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(5,3,7)
imshow(A_rec2(:, :, 1)); % Imagen 1 reconstruida con el Algoritmo 5
title('Imagen 1 reconstruida con el Algoritmo 5');
subplot(5,3,8)
imshow(A_rec2(:, :, 77)); % Imagen 77 reconstruida con el Algoritmo 5
title('Imagen 77 reconstruida con el Algoritmo 5');
subplot(5,3,9)
imshow(A_rec2(:, :, 154)); % Imagen 154 reconstruida con el Algoritmo 5
title('Imagen 154 reconstruida con el Algoritmo 5');

% Eliminación de ruido con el método iterativo IT
toc;
Bt = tCTranspose(B);
BBt = tprod(B,Bt);
alpha = tNorm2(BBt);
X = (1/alpha^2)*BBt;
for k = 1:iterMax
    X = formulaIterative(X,BBt,s); 
    Sp = tprod(Bt,X);
    e1 = tNorm2(tprod(tprod(B,Sp),B)-B);
    if e1 < tol
        break
    end
end
% Reconstrucción de la imagen
F2 = tprod(A,Sp);
A_rec2 = tprod(F2,B);
IT_toc = toc;
A_rec2 = im2double(A_rec2);
SSIM_IT = SSIM(A,A_rec2);
errorIT = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(5,3,10)
imshow(A_rec2(:, :, 1)); % Imagen 1 reconstruida con IT
title('Imagen 1 reconstruida con IT');
subplot(5,3,11)
imshow(A_rec2(:, :, 77)); % Imagen 77 reconstruida con IT
title('Imagen 77 reconstruida con IT');
subplot(5,3,12)
imshow(A_rec2(:, :, 154)); % Imagen 154 reconstruida con IT
title('Imagen 154 reconstruida con IT');

% Eliminación de ruido con el método conjugate gradient
tic;
[conjugate_pseudo, ~] = conjugate_gradient(B,1000,tol);
F2=tprod(A,conjugate_pseudo); % Reconstrucción de la imagen
A_rec2=tprod(F2,B);
A_rec2 = im2double(A_rec2);
conj_toc = toc;
SSIM_conjugate = SSIM(A,A_rec2);
error_conjugate = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(5,3,13)
imshow(A_rec2(:, :, 1)); % Imagen 1 reconstruida con conjugate gradient
title('Imagen 1 reconstruida con CGT');
subplot(5,3,14)
imshow(A_rec2(:, :, 77)); % Imagen 77 reconstruida con conjugate gradient
title('Imagen 77 reconstruida con CGT');
subplot(5,3,15)
imshow(A_rec2(:, :, 154)); % Imagen 154 reconstruida con conjugate gradient
title('Imagen 154 reconstruida con CGT');

disp(' ')

texto = ['La duración, los valores ssim y...' ...
    'los errores mínimos al reducir el ruido en la base de datos a escala de grises viene dada por'];

disp(texto)

disp(' ')

%Construcción de la tabla de resultados
tiempos   = [Alg_4_toc,    IT_toc,    conj_toc];
ssim_vals = [SSIM_alg_4,   SSIM_IT,   SSIM_conjugate];
errores   = [error_alg_4,  errorIT,   error_conjugate];
cols = {'Algoritmo 5','IT','CGT'};
rows = {'Tiempo_s','SSIM','Error_medio'};
format short
tabla = array2table([tiempos; ssim_vals; errores], ...
                    'VariableNames', cols, ...
                    'RowNames', rows);
disp(tabla)
