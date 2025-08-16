
% Experimento 4: Reducción de ruido en base de datos de imágenes
%                a color

% Capítulo 6

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos

% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all



%% Ejemplo: tomar 3 imágenes de la base de datos y añadirles ruido

disp('Ejemplo: tomar 3 imágenes de la base de datos y añadirles ruido')

num_imagenes = 100;
indices = randperm(num_imagenes, 3); %selecciona tres números distintos entre 1 y 100
figure(1)
for i = 1:3
    text = ['entrenamiento\entrenamiento (' num2str(indices(i)) ').jpg'];
    Xi = im2double(imread(text));
    subplot(3, 2, 2*(i-1) + 1)
    imshow(Xi)
    title(['Imagen fuente ',num2str(indices(i))])
    Yi = imnoise(Xi, 'gaussian', 0, 0.05); %Ruido simulado
    subplot(3, 2, 2*i)
    imshow(Yi)
    title(['Imagen con ruido ',num2str(indices(i))])
end



%% IT: reducción de ruido en las imágenes 4, 31 y 82

clear; 

ruta_carpeta = 'C:\Users\samue\OneDrive - TEC\UCR\Maestría - Métodos matemáticos y aplicaciones\Tesis\Tesis con Juan Pablo\Experimentos\Experimentos_tesis_definitivo\Capítulo 6\Experimento 4 Reducción de ruido en base de datos de imágenes\im2';

disp('IT: reducción de ruido en las imágenes 4, 31 y 82')

% Parámetros iniciales
iterMax = 1000; 
tol = 10^(-10);
s = 10;

% Crear los tensores X e Y
d1 = 128; %Dimension dimensión de cada imagen de la base de datos
d = d1*d1;
X = zeros(d,100,3); Y = zeros(d,100,3);
for k = 1:100
    text = ['entrenamiento\entrenamiento (' num2str(k) ').jpg'];
    Xk = im2double(imread(text));
    Yk = imnoise(Xk, 'gaussian', 0, 0.05); %Simulate Noise
    
    % Agregar imagen en color al tensor X (datos sin ruido)
    Xk_r = Xk(:,:,1); vXk_r=Xk_r(:);
    Xk_g = Xk(:,:,2); vXk_g=Xk_g(:);
    Xk_b = Xk(:,:,3); vXk_b=Xk_b(:);            
    X(:,k,1) = vXk_r; X(:,k,2) = vXk_g; X(:,k,3) = vXk_b;
    
    % Añadir imagen a color al tensor Y (datos con ruido)
    Yk_r = Yk(:,:,1); vYk_r=Yk_r(:);
    Yk_g = Yk(:,:,2); vYk_g=Yk_g(:);
    Yk_b = Yk(:,:,3); vYk_b=Yk_b(:);            
    Y(:,k,1) = vYk_r; Y(:,k,2) = vYk_g; Y(:,k,3) = vYk_b;            
end

tic;
% Cálculo del tensor filtro
F = least_square_tensor_soto_2023(X,Y, iterMax, s, tol);

%Reducción de ruido a cada una de las imágenes
lista = [4, 31, 82];
figure(3)
for j=1:3
    %Lectura de cada imagen
    I = im2double(imread(['source_image_',num2str(j),'.jpg']));
    C = im2double(imread(['observed_image_',num2str(j),'.jpg']));

    % Tensor representation of images
    [m,n,p] = size(I);
    X = zeros(m*n,1,p);
    Y = zeros(m*n,1,p);

    for k = 1:n
        X(m*(k-1)+1:m*k,1,:) = I(:,k,:);
        Y(m*(k-1)+1:m*k,1,:) = C(:,k,:);
    end

    %Filter image with Noise
    Xe = im2uint8(cprod(F,Y));

    %Tensor to image
    Ie = uint8(zeros(m,n,p));

    for k=1:n
        Ie(:,k,:) = Xe(m*(k-1)+1:m*k,1,:);
    end

    %Plot images
    subplot(3,3,3*(j-1)+1)
    imshow(I)
    title(['Imagen fuente ',num2str(lista(j))])
    subplot(3,3,3*(j-1)+2)
    imshow(C)
    title(['Imagen observada con ruido ',num2str(lista(j))])
    subplot(3,3,3*(j-1)+3)
    imshow(Ie)
    title(['Imagen con ruido reducido ',num2str(lista(j))])
    imwrite(Ie, fullfile(ruta_carpeta, ['IT_Estimation Image ',num2str(lista(j)),'.jpg']));

    disp(' ')

    texto = ['Los valores ssim y el error cuadrático medio ' ...
        'al reducir el ruido usando método IT en la imagen ', num2str(lista(j)), ' vienen dados por'];

    disp(texto)

    disp(' ')
    
    %Valor SSIM
    Valor_ssim = SSIM(im2double(I),im2double(Ie));
    display(['Valor SSIM de la imagen ',num2str(lista(j)),': = ', num2str(Valor_ssim)])

    %MSE
    mse_error = (1/(m*n*p))*frob_norm_3D(im2double(I)-im2double(Ie))^2;
    display(['MSE de la imagen ',num2str(lista(j)),': = ', num2str(mse_error)])   

     
end
toc;

disp(' ')

text = ['El tiempo de ejecución del método IT viene dado por ', toc];
disp(texto)

disp(' ')

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')

disp(' ')

