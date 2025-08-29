
% Experimento 2: Reducción de ruido en video a escala de grises
%Capítulo 6
%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos
% Autor = Valverde-Sánchez, Samuel
% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all

%% Reducción de ruido en video a escala de grises
                 
% Parámetros iniciales
iterMax = 1000; tol = 1e-10; s = 10; 

%Cargar el video original
video = VideoReader('video.mp4');
p = video.NumFrames;
m = video.Height;
n = video.Width;

%Construir un tensor con el video y garantía que el video sea a escala de
%grises.
A = zeros(m, n, p, 'uint8');
i = 1;
while hasFrame(video)    
    frame = readFrame(video);
    frame  = rgb2gray(frame);
    A(:, :,i) = frame;    
    i = i + 1;
end
A = im2double(A);  % Convertir A a tipo double

%Visualización de los frames 1, 150 y 300 del video original (sin ruido)
subplot(5,3,1)
imshow(A(:, :, 1)); % Frame 1 del video original
title('Frame 1 del video original');
subplot(5,3,2)
imshow(A(:, :,150)); % Frame 150 del video original
title('Frame 150 del video original');
subplot(5,3,3)
imshow(A(:, :, 300)); % Frame 300 del video original
title('Frame 300 del video original');

% Cargar el video con ruido
video_ruido = VideoReader('video9_ruido.mp4');

%Construir un tensor con el video con ruido y garantía que esté a escala de
%grises

B = zeros(m, n, p, 'uint8');
i = 1;
while hasFrame(video_ruido)
    frame = readFrame(video_ruido);
    frame  = rgb2gray(frame);
    B(:, :,i) = frame;    
    i = i + 1;
end
B = im2double(B);

%Visualización de los frames 1, 150 y 300 del video con ruido
subplot(5,3,4)
imshow(B(:, :, 1)); % Frame 1 del video con ruido
title('Frame 1 del video con ruido');
subplot(5,3,5)
imshow(B(:, :, 150)); % Frame 150 del video con ruido
title('Frame 150 del video con ruido');
subplot(5,3,6)
imshow(B(:, :, 300)); % Frame 300 del video con ruido
title('Frame 300 del video con ruido');

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
imshow(A_rec2(:, :, 1)); % Frame 1 del video reconstruido con Algoritmo 5
title('Frame 1 del video reconstruido con Algoritmo 5');
subplot(5,3,8)
imshow(A_rec2(:, :, 150)); % Frame 150 del video reconstruido con Algoritmo 5
title('Frame 150 del video reconstruido con Algoritmo 5');
subplot(5,3,9)
imshow(A_rec2(:, :, 300)); % Frame 300 del video reconstruido con Algoritmo 5
title('Frame 300 del video reconstruido con Algoritmo 5');

% Eliminación de ruido con el método iterativo IT Soto (2023)
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
imshow(A_rec2(:, :, 1)); % Frame 1 del video reconstruido con IT
title('Frame 1 del video reconstruido con IT');
subplot(5,3,11)
imshow(A_rec2(:, :, 150)); % Frame 150 del video reconstruido con IT
title('Frame 150 del video reconstruido con IT');
subplot(5,3,12)
imshow(A_rec2(:, :, 300)); % Frame 300 del video reconstruido con IT
title('Frame 300 del video reconstruido con IT');

% Eliminación de ruido con el método conjugate gradient
tic;
[conjugate_pseudo, ~] = conjugate_gradient(B,iterMax,tol);
F2=tprod(A,conjugate_pseudo); % Reconstrucción de la imagen
A_rec2=tprod(F2,B);
A_rec2 = im2double(A_rec2);
conj_toc = toc;
SSIM_conjugate = SSIM(A,A_rec2);
error_conjugate = (1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(5,3,13)
imshow(A_rec2(:, :, 1)); % Frame 1 del video reconstruido con conjugate gradient
title('Frame 1 del video reconstruido con CGT');
subplot(5,3,14)
imshow(A_rec2(:, :, 150)); % Frame 150 del video reconstruido con conjugate gradient
title('Frame 150 del video reconstruido con CGT');
subplot(5,3,15)
imshow(A_rec2(:, :, 300)); % Frame 300 del video reconstruido con conjugate gradient
title('Frame 300 del video reconstruido con CGT');

disp(' ')

texto = ['La duración, los valores ssim y los errores mínimos al reducir el ruido en el video de tamaño ',...
    num2str(m), ' x ', num2str(n), ' x ', num2str(p), ' vienen dados por'];

disp(texto)

disp(' ')

% Construcción de la tabla de resultados
tiempos   = [Alg_4_toc,    IT_toc,    conj_toc];
ssim_vals = [SSIM_alg_4,    SSIM_IT,   SSIM_conjugate];
errores   = [error_alg_4,   errorIT,   error_conjugate];
cols = {'Algoritmo 5','IT','CGT'};
rows = {'Tiempo','Valor SSIM','Error'};
format short
tabla = array2table([tiempos; ssim_vals; errores], ...
                    'VariableNames', cols, ...
                    'RowNames', rows);
disp(tabla)


