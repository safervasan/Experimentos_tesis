
% Experimento 2: Aproximación de la solución de un sistema multilineal

% Capítulo 4

% Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos
% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all


%% Estimación de la solución del sistema multilineal (Caso 1)

format long

% Parámetros iniciales
m = 100;
p = 10;
s = 10; 
k = 1000;
A = randn(m,m,p);
AI = idct(tensor_diagonal_dominante1(A),[],3);
B = randn(m,1,p);
iterMax = 1000; tol = 1e-10;

%Cálculo de errores de estimación (sistema multilineal), tiempos de ejecución, espacio en
%memoria, número de iteraciones y error mínimo por algoritmo

%Estimación de la inversa por Soto (2023)
[dur_soto,inv_soto,it_soto, e_soto] = Soto2023(AI,iterMax,s,tol);
error_soto = error_inversa_t(AI,B,inv_soto);
info_soto = whos("inv_soto");

%Estimación de la inversa usando el c-producto reducido
[dur_c,inv_c, it_cp, e_cp] = cpseudoinv(AI,iterMax,s,tol);
error_c = error_inversa_c(AI,B,inv_c);
info_cpseudo = whos("inv_c");

%Estimación de la inversa método de Jacobi
[inv_jacobi, dur_jacobi, it_jacobi, e_jac] = Jacobi(AI, B, k, tol);
error_jacobi = error_inversa_jacobi_seidel(AI,B,inv_jacobi);
info_jacobi = whos("inv_jacobi");

%Estimación de la inversa método de Gauss-Seidel
[inv_gauss, dur_gauss, it_gaus, e_gaus] = Gauss_Seidel1(AI, B, k, tol);
error_gauss = error_inversa_jacobi_seidel(AI,B,inv_gauss);
info_gauss = whos("inv_gauss");

%Estimación de la inversa método de Gradiente conjugado
[inv_grad, ~, dur_grad,iter_cong, e_cong] = conjugate_gradient(AI,iterMax,tol);
error_grad = error_inversa_t(AI,B,inv_grad);
info_grad = whos("inv_grad");

%Estimación de la inversa método outerinv
[inv_out, dur_out] = outerinv(AI);
error_out = error_inversa_c(AI,B,inv_out);
info_out = whos("inv_out");

%Estimación de la inversa método pinv
[dur_pinv, inv_pinv] = tpinv(AI);
error_pinv = error_inversa_t(AI,B,inv_pinv);
info_pinv = whos("inv_pinv");

texto2 = ['Iteraciones y errores finales al estimar la solución del sistema multilineal (Caso 1)'];
disp(texto2)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales = [e_soto(end), e_cp(end), e_jac(end), e_gaus(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales = [it_soto(end), it_cp(end), it_jacobi(end), it_gaus(end), iter_cong(end)];

% Encabezados de la tabla
col2 = {'Soto (2023)', 'c-prod red', 'Jacobi', 'Gauss-Seidel', 'Grad Conj'};
filas2 = {'Error final (e)', 'Iteraciones'};

% Crear tabla
tabla2 = array2table([errores_finales; iteraciones_finales], ...
    'VariableNames', col2, 'RowNames', filas2);

disp(tabla2)


%%%Tabla de comparación de los métodos iterativos

texto = ['Iteraciones, duración y errores mínimos al estimar la solución del sistema multilineal (Caso 1)'];
disp(texto)

disp(' ')

errores1 = [error_soto, error_c, error_jacobi, error_gauss, error_grad, error_out, error_pinv];
duracion1 = [dur_soto, dur_c, dur_jacobi, dur_gauss, dur_grad, dur_out, dur_pinv];
memoria1 = [info_soto.bytes, info_cpseudo.bytes, info_jacobi.bytes, info_gauss.bytes, info_grad.bytes, info_out.bytes, info_pinv.bytes];
col1 = {'IT','Alg 4', 'HOJ', 'HOGS', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format long
tabla = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla)

%% Estimación de la solución del sistema multilineal (Caso 2)

format short

% Parámetros iniciales
m = 400;
p = 10;
s = 10; 
k = 1000;
A = randn(m,m,p);
AI = idct(tensor_diagonal_dominante1(A),[],3);
B = randn(m,1,p);
iterMax = 1000; tol = 1e-10;

%Cálculo de errores de estimación (sistema multilineal), tiempos de ejecución, espacio en
%memoria, número de iteraciones y error mínimo por algoritmo

%Estimación de la inversa por Soto (2023)
[dur_soto,inv_soto,it_soto, e_soto] = Soto2023(AI,iterMax,s,tol);
error_soto = error_inversa_t(AI,B,inv_soto);
info_soto = whos("inv_soto");

%Estimación de la inversa usando el c-producto reducido
[dur_c,inv_c, it_cp, e_cp] = cpseudoinv(AI,iterMax,s,tol);
error_c = error_inversa_c(AI,B,inv_c);
info_cpseudo = whos("inv_c");

%Estimación de la inversa método de Jacobi
[inv_jacobi, dur_jacobi, it_jacobi, e_jac] = Jacobi(AI, B, k, tol);
error_jacobi = error_inversa_jacobi_seidel(AI,B,inv_jacobi);
info_jacobi = whos("inv_jacobi");

%Estimación de la inversa método de Gauss-Seidel
[inv_gauss, dur_gauss, it_gaus, e_gaus] = Gauss_Seidel1(AI, B, k, tol);
error_gauss = error_inversa_jacobi_seidel(AI,B,inv_gauss);
info_gauss = whos("inv_gauss");

%Estimación de la inversa método de Gradiente conjugado
[inv_grad, ~, dur_grad,iter_cong, e_cong] = conjugate_gradient(AI,iterMax,tol);
error_grad = error_inversa_t(AI,B,inv_grad);
info_grad = whos("inv_grad");

%Estimación de la inversa método outerinv
[inv_out, dur_out] = outerinv(AI);
error_out = error_inversa_c(AI,B,inv_out);
info_out = whos("inv_out");

%Estimación de la inversa método pinv
[dur_pinv, inv_pinv] = tpinv(AI);
error_pinv = error_inversa_t(AI,B,inv_pinv);
info_pinv = whos("inv_pinv");

texto2 = ['Iteraciones y errores finales al estimar la solución del sistema multilineal (Caso 2)'];
disp(texto2)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales = [e_soto(end), e_cp(end), e_jac(end), e_gaus(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales = [it_soto(end), it_cp(end), it_jacobi(end), it_gaus(end), iter_cong(end)];

% Encabezados de la tabla
col2 = {'Soto (2023)', 'c-prod red', 'Jacobi', 'Gauss-Seidel', 'Grad Conj'};
filas2 = {'Error final (e)', 'Iteraciones'};

% Crear tabla
tabla2 = array2table([errores_finales; iteraciones_finales], ...
    'VariableNames', col2, 'RowNames', filas2);

disp(tabla2)


%%%Tabla de comparación de los métodos iterativos

texto = ['Iteraciones, duración y errores mínimos al estimar la solución del sistema multilineal (Caso 2)'];
disp(texto)

disp(' ')

errores1 = [error_soto, error_c, error_jacobi, error_gauss, error_grad, error_out, error_pinv];
duracion1 = [dur_soto, dur_c, dur_jacobi, dur_gauss, dur_grad, dur_out, dur_pinv];
memoria1 = [info_soto.bytes, info_cpseudo.bytes, info_jacobi.bytes, info_gauss.bytes, info_grad.bytes, info_out.bytes, info_pinv.bytes];
col1 = {'IT','Alg 4', 'HOJ', 'HOGS', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format long
tabla = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla)

%% Estimación de la solución del sistema multilineal (Caso 3)

format short

% Parámetros iniciales
m = 700;
p = 10;
s = 10; 
k = 1000;
A = randn(m,m,p);
AI = idct(tensor_diagonal_dominante1(A),[],3);
B = randn(m,1,p);
iterMax = 1000; tol = 1e-10;

%Cálculo de errores de estimación (sistema multilineal), tiempos de ejecución, espacio en
%memoria, número de iteraciones y error mínimo por algoritmo

%Estimación de la inversa por Soto (2023)
[dur_soto,inv_soto,it_soto, e_soto] = Soto2023(AI,iterMax,s,tol);
error_soto = error_inversa_t(AI,B,inv_soto);
info_soto = whos("inv_soto");

%Estimación de la inversa usando el c-producto reducido
[dur_c,inv_c, it_cp, e_cp] = cpseudoinv(AI,iterMax,s,tol);
error_c = error_inversa_c(AI,B,inv_c);
info_cpseudo = whos("inv_c");

%Estimación de la inversa método de Jacobi
[inv_jacobi, dur_jacobi, it_jacobi, e_jac] = Jacobi(AI, B, k, tol);
error_jacobi = error_inversa_jacobi_seidel(AI,B,inv_jacobi);
info_jacobi = whos("inv_jacobi");

%Estimación de la inversa método de Gauss-Seidel
[inv_gauss, dur_gauss, it_gaus, e_gaus] = Gauss_Seidel1(AI, B, k, tol);
error_gauss = error_inversa_jacobi_seidel(AI,B,inv_gauss);
info_gauss = whos("inv_gauss");

%Estimación de la inversa método de Gradiente conjugado
[inv_grad, ~, dur_grad,iter_cong, e_cong] = conjugate_gradient(AI,iterMax,tol);
error_grad = error_inversa_t(AI,B,inv_grad);
info_grad = whos("inv_grad");

%Estimación de la inversa método outerinv
[inv_out, dur_out] = outerinv(AI);
error_out = error_inversa_c(AI,B,inv_out);
info_out = whos("inv_out");

%Estimación de la inversa método pinv
[dur_pinv, inv_pinv] = tpinv(AI);
error_pinv = error_inversa_t(AI,B,inv_pinv);
info_pinv = whos("inv_pinv");

texto2 = ['Iteraciones y errores finales al estimar la solución del sistema multilineal (Caso 3)'];
disp(texto2)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales = [e_soto(end), e_cp(end), e_jac(end), e_gaus(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales = [it_soto(end), it_cp(end), it_jacobi(end), it_gaus(end), iter_cong(end)];

% Encabezados de la tabla
col2 = {'Soto (2023)', 'c-prod red', 'Jacobi', 'Gauss-Seidel', 'Grad Conj'};
filas2 = {'Error final (e)', 'Iteraciones'};

% Crear tabla
tabla2 = array2table([errores_finales; iteraciones_finales], ...
    'VariableNames', col2, 'RowNames', filas2);

disp(tabla2)


%%%Tabla de comparación de los métodos iterativos

texto = ['Iteraciones, duración y errores mínimos al estimar la solución del sistema multilineal (Caso 3)'];
disp(texto)

disp(' ')

errores1 = [error_soto, error_c, error_jacobi, error_gauss, error_grad, error_out, error_pinv];
duracion1 = [dur_soto, dur_c, dur_jacobi, dur_gauss, dur_grad, dur_out, dur_pinv];
memoria1 = [info_soto.bytes, info_cpseudo.bytes, info_jacobi.bytes, info_gauss.bytes, info_grad.bytes, info_out.bytes, info_pinv.bytes];
col1 = {'IT','Alg 4', 'HOJ', 'HOGS', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format long
tabla = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla)