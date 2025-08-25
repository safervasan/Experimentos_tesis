
%Experimento 2: Comparación de métodos para estimar A†

%Capítulo 5

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos

% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all

%% Estimación de la pseudoinversa tensorial para A1 de tamaño 250x500x15

% Parámetros iniciales
m = 250;
n = 500;
p = 15;
A = randn(m,n,p);
tol = 1e-12;
MaxIter = 1000;
s = 10;

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);
info_pseudo_c = whos("pseudo_c");

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);
info_pseudo_soto = whos("pseudo_soto");

%Estimación de la inversa método de Gradiente conjugado
[pseudo_grad, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);
info_pseudo_grad = whos("pseudo_grad");

texto3 = ['Iteraciones y errores finales al estimar la pseudoinversa ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto3)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales_pseudo = [e_cpseudo(end), e_tpseudo(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales_pseudo = [it_cpseudo(end), it_tpseudo(end), it_cong(end)];

% Encabezados de la tabla
col3 = {'Alg 5', 'Soto (2023)', 'Grad Conj'};
filas3 = {'Error final', 'Iteraciones'};

% Crear tabla
tabla3 = array2table([errores_finales_pseudo; iteraciones_finales_pseudo], ...
    'VariableNames', col3, 'RowNames', filas3);

disp(tabla3)

%Estimación de la inversa método outerinv
[pseudo_out, dur_out] = outerinv(c_traspuesta(A));
pseudo_out = c_traspuesta(pseudo_out);
error_pseudo_out = error_pseudoinversa_c(A,pseudo_out);
info_pseudo_out = whos("pseudo_out");

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);
info_pseudo_tpinv = whos("pseudo_out");

texto = ['Errores mínimos, duración y espacio en memoria al pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
memoria1 = [info_pseudo_c.bytes, info_pseudo_soto.bytes, info_pseudo_grad.bytes, info_pseudo_out.bytes, info_pseudo_tpinv.bytes];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format short
tabla1 = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp (tabla1)

%% Estimación de la pseudoinversa tensorial para A2 de tamaño 600x100x15

% Parámetros iniciales
m = 600;
n = 100;
p = 15;
A = randn(m,n,p);

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);
info_pseudo_c = whos("pseudo_c");

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);
info_pseudo_soto = whos("pseudo_soto");

%Estimación de la inversa método de Gradiente conjugado
[pseudo_grad, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);
info_pseudo_grad = whos("pseudo_grad");

texto3 = ['Iteraciones y errores finales al estimar la pseudoinversa ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto3)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales_pseudo = [e_cpseudo(end), e_tpseudo(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales_pseudo = [it_cpseudo(end), it_tpseudo(end), it_cong(end)];

% Encabezados de la tabla
col3 = {'Alg 5', 'Soto (2023)', 'Grad Conj'};
filas3 = {'Error final', 'Iteraciones'};

% Crear tabla
tabla3 = array2table([errores_finales_pseudo; iteraciones_finales_pseudo], ...
    'VariableNames', col3, 'RowNames', filas3);

disp(tabla3)

%Estimación de la inversa método outerinv
[pseudo_out, dur_out] = outerinv(A);
error_pseudo_out = error_pseudoinversa_c(A,pseudo_out);
info_pseudo_out = whos("pseudo_out");

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);
info_pseudo_tpinv = whos("pseudo_out");

texto = ['Errores mínimos, duración y espacio en memoria al pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
memoria1 = [info_pseudo_c.bytes, info_pseudo_soto.bytes, info_pseudo_grad.bytes, info_pseudo_out.bytes, info_pseudo_tpinv.bytes];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format short
tabla2 = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla2)

%% Estimación de la pseudoinversa tensorial para A3 de tamaño 300x400x15

% Parámetros iniciales
m = 300;
n = 400;
p = 15;
A = randn(m,n,p);

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);
info_pseudo_c = whos("pseudo_c");

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);
info_pseudo_soto = whos("pseudo_soto");

%Estimación de la inversa método de Gradiente conjugado
[pseudo_grad, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);
info_pseudo_grad = whos("pseudo_grad");

texto3 = ['Iteraciones y errores finales al estimar la pseudoinversa ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto3)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales_pseudo = [e_cpseudo(end), e_tpseudo(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales_pseudo = [it_cpseudo(end), it_tpseudo(end), it_cong(end)];

% Encabezados de la tabla
col3 = {'Alg 5', 'Soto (2023)', 'Grad Conj'};
filas3 = {'Error final', 'Iteraciones'};

% Crear tabla
tabla3 = array2table([errores_finales_pseudo; iteraciones_finales_pseudo], ...
    'VariableNames', col3, 'RowNames', filas3);

disp(tabla3)

%Estimación de la inversa método outerinv
[pseudo_out, dur_out] = outerinv(c_traspuesta(A));
pseudo_out = c_traspuesta(pseudo_out);
error_pseudo_out = error_pseudoinversa_c(A,pseudo_out);
info_pseudo_out = whos("pseudo_out");

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);
info_pseudo_tpinv = whos("pseudo_out");

texto = ['Errores mínimos, duración y espacio en memoria al pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
memoria1 = [info_pseudo_c.bytes, info_pseudo_soto.bytes, info_pseudo_grad.bytes, info_pseudo_out.bytes, info_pseudo_tpinv.bytes];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format short
tabla3 = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla3)

%% Estimación de la pseudoinversa tensorial para A4 de tamaño 325x300x15

% Parámetros iniciales
m = 325;
n = 300;
p = 15;
A = randn(m,n,p);

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);
info_pseudo_c = whos("pseudo_c");

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);
info_pseudo_soto = whos("pseudo_soto");

%Estimación de la inversa método de Gradiente conjugado
[pseudo_grad, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);
info_pseudo_grad = whos("pseudo_grad");

texto3 = ['Iteraciones y errores finales al estimar la pseudoinversa ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto3)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales_pseudo = [e_cpseudo(end), e_tpseudo(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales_pseudo = [it_cpseudo(end), it_tpseudo(end), it_cong(end)];

% Encabezados de la tabla
col3 = {'Alg 5', 'Soto (2023)', 'Grad Conj'};
filas3 = {'Error final', 'Iteraciones'};

% Crear tabla
tabla3 = array2table([errores_finales_pseudo; iteraciones_finales_pseudo], ...
    'VariableNames', col3, 'RowNames', filas3);

disp(tabla3)

%Estimación de la inversa método outerinv
[pseudo_out, dur_out] = outerinv(A);
error_pseudo_out = error_pseudoinversa_c(A,pseudo_out);
info_pseudo_out = whos("pseudo_out");

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);
info_pseudo_tpinv = whos("pseudo_out");

texto = ['Errores mínimos, duración y espacio en memoria al pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
memoria1 = [info_pseudo_c.bytes, info_pseudo_soto.bytes, info_pseudo_grad.bytes, info_pseudo_out.bytes, info_pseudo_tpinv.bytes];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format short
tabla4 = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla4)


%% Estimación de la pseudoinversa tensorial para A5 de tamaño 190x200x15

% Parámetros iniciales
m = 190;
n = 200;
p = 15;
A = randn(m,n,p);

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);
info_pseudo_c = whos("pseudo_c");

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);
info_pseudo_soto = whos("pseudo_soto");

%Estimación de la inversa método de Gradiente conjugado
[pseudo_grad, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);
info_pseudo_grad = whos("pseudo_grad");

texto3 = ['Iteraciones y errores finales al estimar la pseudoinversa ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto3)

disp(' ')

% Tomar el último error (de los vectores e_)
errores_finales_pseudo = [e_cpseudo(end), e_tpseudo(end), e_cong(end)];

% Tomar la última iteración
iteraciones_finales_pseudo = [it_cpseudo(end), it_tpseudo(end), it_cong(end)];

% Encabezados de la tabla
col3 = {'Alg 5', 'Soto (2023)', 'Grad Conj'};
filas3 = {'Error final', 'Iteraciones'};

% Crear tabla
tabla3 = array2table([errores_finales_pseudo; iteraciones_finales_pseudo], ...
    'VariableNames', col3, 'RowNames', filas3);

disp(tabla3)

%Estimación de la inversa método outerinv
[pseudo_out, dur_out] = outerinv(c_traspuesta(A));
pseudo_out = c_traspuesta(pseudo_out);
error_pseudo_out = error_pseudoinversa_c(A,pseudo_out);
info_pseudo_out = whos("pseudo_out");

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);
info_pseudo_tpinv = whos("pseudo_out");

texto = ['Errores mínimos, duración y espacio en memoria al pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
memoria1 = [info_pseudo_c.bytes, info_pseudo_soto.bytes, info_pseudo_grad.bytes, info_pseudo_out.bytes, info_pseudo_tpinv.bytes];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración', 'Memoria'};
format short
tabla5 = array2table([errores1;duracion1;memoria1],'VariableNames',col1,'RowNames',filas1);
disp(tabla5)

