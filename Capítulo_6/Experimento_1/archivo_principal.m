
% Experimento 1: Reducción de ruido en imágenes a color
%Capítulo 6
%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos
% Autor = Valverde-Sánchez, Samuel
% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all

%% Reducción de ruido en la imagen 1

% Abrir ventana para la imagen 1
figure(1), clf                     

% Parámetros iniciales
iterMax = 1000; tol = 1e-10; s = 10; 

%Cargar la imagen fuente
A = im2double(imread('imagen1.jpg'));
[m,n,p] = size(A);
texto = ['La imagen 1 es de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
subplot(1,5,1)
imshow(A)
title('Imagen 1 (fuente)')
disp(texto)

% Cargar la imagen con ruido
B = im2double(imread('imagen1_ruido.jpg'));
subplot(1,5,2)
imshow(B)
title('Imagen 1 (con ruido)')

% Eliminación de ruido con el Algoritmo 5
tic;
I = c_identidad(m,p);
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
F2=cprod(A,X);
A_rec2=cprod(F2,B);
Alg_4_toc = toc;
SSIM_alg_4 = SSIM(A,A_rec2);
error_alg_4 = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,3)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con Algoritmo 5')

%Reducción de ruido con el método IT propuesto por Soto(2023)
tic;
BBt = tCTranspose(B);
alpha = tNorm2(BBt);
X = (1/alpha^2)*BBt;
for k = 1:iterMax            
    X = formulaIterative(X,B,s);
    e1 = tNorm2(tprod(tprod(B,X),B)-B); 
    if e1 < tol
        break
    end
end
% Reconstrucción de la imagen
F2=tprod(A,X);
A_rec2=tprod(F2,B);
IT_toc = toc;
SSIM_IT = SSIM(A,A_rec2);
errorIT = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,4)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con IT')

%Reducción de ruido con el método gradiente conjugado
tic;
[conjugate_pseudo, ~] = conjugate_gradient(B,iterMax,tol);
% Reconstrucción de la imagen
F2=tprod(A,conjugate_pseudo);
A_rec2 = tprod(F2,B);
conj_toc = toc;
SSIM_conjugate = SSIM(A,A_rec2);
error_conjugate = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,5)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con CGT')

disp(' ')

texto = ['La duración, los valores ssim y los errores mínimos al reducir el ruido en la imagen 1 vienen dados por'];
disp(texto)

disp(' ')

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

disp(" ")

disp(" ")


%% Reducción de ruido en la imagen 2

% Abrir ventana para la imagen 2
figure(2), clf

%Cargar la imagen fuente
A = im2double(imread('imagen2.jpg'));
[m,n,p] = size(A);
texto = ['La imagen 2 es de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
subplot(1,5,1)
imshow(A)
title('Imagen 2 (fuente)')
disp(texto)

% Cargar la imagen con ruido
B = im2double(imread('imagen2_ruido.jpg'));
subplot(1,5,2)
imshow(B)
title('Imagen 2 (con ruido)')

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
SSIM_alg_4 = SSIM(A,A_rec2);
error_alg_4 = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,3)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con Algoritmo 5')

%Reducción de ruido con el método IT propuesto por Soto(2023)
tic;
BBt = tCTranspose(B);
alpha = tNorm2(BBt);
X = (1/alpha^2)*BBt;
for k = 1:iterMax            
    X = formulaIterative(X,B,s);
    e1 = tNorm2(tprod(tprod(B,X),B)-B); 
    if e1 < tol
        break
    end
end
% Reconstrucción de la imagen
F2 = tprod(A,X);
A_rec2=tprod(F2,B);
IT_toc = toc;
SSIM_IT = SSIM(A,A_rec2);
errorIT = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,4)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con el método IT')

%Método 5 Reducción de ruido con el método gradiente conjugado
tic;
[conjugate_pseudo, ~] = conjugate_gradient(B,iterMax,tol);
% Reconstrucción de la imagen
F2 = tprod(A,conjugate_pseudo);
A_rec2 = tprod(F2,B);
conj_toc = toc;
SSIM_conjugate = SSIM(A,A_rec2);
error_conjugate = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,5)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con CGT')

disp(' ')

texto = ['La duración, los valores ssim y los errores mínimos al reducir el ruido en la imagen 2 vienen dados por'];
disp(texto)

disp(' ')

tiempos   = [Alg_4_toc,    IT_toc,    conj_toc];
ssim_vals = [SSIM_alg_4,   SSIM_IT,   SSIM_conjugate];
errores   = [error_alg_4,  errorIT,   error_conjugate];
cols = {'Algoritmo 5','IT','CHT'};
rows = {'Tiempo_s','SSIM','Error_medio'};
format short
tabla = array2table([tiempos; ssim_vals; errores], ...
                    'VariableNames', cols, ...
                    'RowNames', rows);
disp(tabla)

disp(" ")

disp(" ")


%% Reducción de ruido en la imagen 3

% Abrir ventana para la imagen 3
figure(3), clf

%Cargar la imagen fuente
A = im2double(imread('imagen3.jpg'));
[m,n,p] = size(A);
texto = ['La imagen 3 es de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
subplot(1,5,1)
imshow(A)
title('Imagen 3 (fuente)')
disp(texto)

% Cargar la imagen con ruido
B = im2double(imread('imagen3_ruido.jpg'));
subplot(1,5,2)
imshow(B)
title('Imagen 3 (con ruido)')

%Eliminación de ruido con el Algoritmo 4
tic;
I = c_identidad(m,p);
BBt=c_traspuesta(B);
alpha=c_norma2(BBt);
X=(1/alpha^2)*BBt;
for k = 1:iterMax
     X = formula_iterativa(X,B,s); %Estima la pseudoinversa.
     e1 = c_norma2(cprod(B,X)-I);
     if e1 < tol
         break
     end
end
% Reconstruction of image
F2 = cprod(A,X);
A_rec2 = cprod(F2,B);
Alg_4_toc = toc;
SSIM_alg_4 = SSIM(A,A_rec2);
error_alg_4 = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,3)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con el Algoritmo 4')

%Reducción de ruido con el método IT 
tic;
BBt = tCTranspose(B);
alpha = tNorm2(BBt);
X = (1/alpha^2)*BBt;
for k = 1:iterMax            
    X = formulaIterative(X,B,s);
    e1 = tNorm2(tprod(tprod(B,X),B)-B); 
    if e1 < tol
        break
    end
end
% Reconstrucción de la imagen
F2=tprod(A,X);
A_rec2=tprod(F2,B);
IT_toc = toc;
SSIM_IT = SSIM(A,A_rec2);
errorIT = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,5,4)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con IT')

%Reducción de ruido con el método gradiente conjugado
tic;
[conjugate_pseudo, ~] = conjugate_gradient(B,iterMax,tol);
% Reconstruction of image
F2=tprod(A,conjugate_pseudo);
A_rec2=tprod(F2,B);
conj_toc = toc;
SSIM_conjugate = SSIM(A,A_rec2);
error_conjugate = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,8,7)
imshow(im2uint8(A_rec2))
title('Reducción de ruido con CGT')

disp(' ')

texto = ['La duración, los valores ssim y los errores mínimos al reducir el ruido en la imagen 3 vienen dados por'];
disp(texto)

disp(' ')

tiempos   = [Alg_4_toc,    IT_toc,    conj_toc];
ssim_vals = [SSIM_alg_4,   SSIM_IT,   SSIM_conjugate];
errores   = [error_alg_4,  errorIT,   error_conjugate];
cols = {'Algoritmo 4','IT','CGT'};
rows = {'Tiempo_s','SSIM','Error_medio'};
format short
tabla = array2table([tiempos; ssim_vals; errores], ...
                    'VariableNames', cols, ...
                    'RowNames', rows);
disp(tabla)