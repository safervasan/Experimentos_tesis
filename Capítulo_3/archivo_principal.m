%Experimento 1: Estimación de la inversa de un tensor tridimensional

%Capítulo 3

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos

% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all

format short
%% Ejemplo de producto tensorial empleando distintas transformaciones

A(:,:,1) = [-5  0;
            -8 -3];

A(:,:,2) = [-1  6;
             1 -1];

A(:,:,3) = [ 5 -6;
             0  7];

% Tensor B
B(:,:,1) = [ 3  2;
             5 -8];

B(:,:,2) = [ 0 -4;
             8 -2];

B(:,:,3) = [ 3  4;
             1 -8];
%% Producto tensorial mediante el t-producto

% Se aplica la DCT en la tercera dimensión de A y B.
At = fft(A,[],3)
Bt = fft(B,[],3)
Ct1 = At(:,:,1)*Bt(:,:,1)
Ct2 = At(:,:,2)*Bt(:,:,2)
Ct3 = At(:,:,3)*Bt(:,:,3)
Ct(:,:,1) = Ct1;
Ct(:,:,2) = Ct2;
Ct(:,:,3) = Ct3;

% Se aplica la forma inversa de DFT a Ct
C_T = ifft(Ct,[],3)

%% Producto tensorial mediante el c-producto 

% Se aplica la DCT en la tercera dimensión de A y B.
Ac = dct_Full(A)
Bc = dct_Full(B)
Cc1 = Ac(:,:,1)*Bc(:,:,1)
Cc2 = Ac(:,:,2)*Bc(:,:,2)
Cc3 = Ac(:,:,3)*Bc(:,:,3)
Cc(:,:,1) = Cc1;
Cc(:,:,2) = Cc2;
Cc(:,:,3) = Cc3;

% Se aplica la forma inversa de DCT a Cc
C_C = idct_Full(Cc)

%% Producto tensorial mediante el c-producto reducido

% Se aplica la DCT en la tercera dimensión de A y B.
Ar = dct(A,[],3)
Br = dct(B,[],3)
Cr1 = Ar(:,:,1)*Br(:,:,1)
Cr2 = Ar(:,:,2)*Br(:,:,2)
Cr3 = Ar(:,:,3)*Br(:,:,3)
Cr(:,:,1) = Cr1;
Cr(:,:,2) = Cr2;
Cr(:,:,3) = Cr3;

% Se aplica la forma inversa de DFT a Ct
C_R = idct(Cr,[],3)