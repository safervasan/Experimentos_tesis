
% Experimento 3: Estimación de A† mediante el incremento de caras frontales

%Capítulo 5

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos

% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all

%% Estimación de la pseudoinversa tensorial para A1 de tamaño 150x450x100

% Parámetros iniciales
m = 150;
n = 450;
p = 100;
A = randn(m,n,p);
tol = 1e-10;
MaxIter = 1000;
s = 10;

%Variables definidas si  el método outerinv falla
pseudo_out = NaN;
dur_out = NaN;
error_pseudo_out = NaN;

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);

%Estimación de la inversa método de Gradiente conjugado
[~, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);

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
try
    [pseudo_tmp, dur_tmp] = outerinv(c_traspuesta(A));
    pseudo_out = c_traspuesta(pseudo_tmp);
    dur_out    = dur_tmp;
    error_pseudo_out = error_pseudoinversa_c(A, pseudo_out);
catch ME
    if strcmp(ME.identifier, 'MATLAB:nomem')
        warning('outerinv no pudo ejecutarse por falta de memoria.');
    else
        warning('outerinv falló por otro motivo (%s): %s.', ...
                ME.identifier, ME.message);
    end
end

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);

texto = ['Errores mínimos y duración al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración'};
format short
tabla1 = array2table([errores1;duracion1],'VariableNames',col1,'RowNames',filas1);
disp (tabla1)

%% Estimación de la pseudoinversa tensorial para A2 de tamaño 150x450x200

% Parámetros iniciales
m = 150;
n = 450;
p = 200;
A = randn(m,n,p);

%Variables definidas si  el método outerinv falla
pseudo_out = NaN;
dur_out = NaN;
error_pseudo_out = NaN;

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);

%Estimación de la inversa método de Gradiente conjugado
[~, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);

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
try
    [pseudo_tmp, dur_tmp] = outerinv(c_traspuesta(A));
    pseudo_out = c_traspuesta(pseudo_tmp);
    dur_out    = dur_tmp;
    error_pseudo_out = error_pseudoinversa_c(A, pseudo_out);

catch ME
    if strcmp(ME.identifier, 'MATLAB:nomem')
        warning('outerinv no pudo ejecutarse por falta de memoria.');
    else
        warning('outerinv falló por otro motivo (%s): %s.', ...
                ME.identifier, ME.message);
    end
end

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);

texto = ['Errores mínimos y duración al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración'};
format short
tabla2 = array2table([errores1;duracion1],'VariableNames',col1,'RowNames',filas1);
disp(tabla2)

%% Estimación de la pseudoinversa tensorial para A3 de tamaño 150x450x300

% Parámetros iniciales
m = 150;
n = 450;
p = 300;
A = randn(m,n,p);

%Variables definidas si  el método outerinv falla
pseudo_out = NaN;
dur_out = NaN;
error_pseudo_out = NaN;

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);

%Estimación de la inversa método de Gradiente conjugado
[~, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);

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
try
    [pseudo_tmp, dur_tmp] = outerinv(c_traspuesta(A));
    pseudo_out = c_traspuesta(pseudo_tmp);
    dur_out    = dur_tmp;
    error_pseudo_out = error_pseudoinversa_c(A, pseudo_out);
catch ME
    % Detectar error de memoria específicamente
    if strcmp(ME.identifier, 'MATLAB:nomem')
        warning('outerinv no pudo ejecutarse por falta de memoria.');
    else
        warning('outerinv falló por otro motivo (%s): %s.', ...
                ME.identifier, ME.message);
    end
end

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);

texto = ['Errores mínimos y duración al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración'};
format short
tabla3 = array2table([errores1;duracion1],'VariableNames',col1,'RowNames',filas1);
disp(tabla3)

%% Estimación de la pseudoinversa tensorial para A4 de tamaño 150x450x400

% Parámetros iniciales
m = 150;
n = 450;
p = 400;
A = randn(m,n,p);

%Variables definidas si  el método outerinv falla
pseudo_out = NaN;
dur_out = NaN;
error_pseudo_out = NaN;

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);

%Estimación de la inversa método de Gradiente conjugado
[~, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);

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
try
    [pseudo_tmp, dur_tmp] = outerinv(c_traspuesta(A));
    pseudo_out = c_traspuesta(pseudo_tmp);
    dur_out    = dur_tmp;
    error_pseudo_out = error_pseudoinversa_c(A, pseudo_out);

catch ME
    % Detectar error de memoria específicamente
    if strcmp(ME.identifier, 'MATLAB:nomem')
        warning('outerinv no pudo ejecutarse por falta de memoria.');
    else
        warning('outerinv falló por otro motivo (%s): %s.', ...
                ME.identifier, ME.message);
    end
end

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);

texto = ['Errores mínimos y duración al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración'};
format short
tabla4 = array2table([errores1;duracion1],'VariableNames',col1,'RowNames',filas1);
disp(tabla4)


%% Estimación de la pseudoinversa tensorial para A5 de tamaño 150x450x500

% Parámetros iniciales
m = 150;
n = 450;
p = 500;
A = randn(m,n,p);

%Variables definidas si  el método outerinv falla
pseudo_out = NaN;
dur_out = NaN;
error_pseudo_out = NaN;

%Estimación pseudoinversa Algoritmo 5
[dur_c,pseudo_c,e_cpseudo, it_cpseudo] = cpseudoinv(A,MaxIter,s,tol);
error_pseudo_c = e_cpseudo(end);

%Iteraciones, errores y tiempos para diferentes valores de s por Soto(2023)
[dur_soto,pseudo_soto,e_tpseudo, it_tpseudo] = tpseudo(A,s,MaxIter,tol);
error_pseudo_soto = e_tpseudo(end);

%Estimación de la inversa método de Gradiente conjugado
[~, ~, dur_grad, e_cong, it_cong] = conjugate_gradient(A,MaxIter,tol);
error_pseudo_grad = e_cong(end);

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
try
    [pseudo_tmp, dur_tmp] = outerinv(c_traspuesta(A));
    pseudo_out = c_traspuesta(pseudo_tmp);
    dur_out    = dur_tmp;
    error_pseudo_out = error_pseudoinversa_c(A, pseudo_out);
catch ME
    % Detectar error de memoria específicamente
    if strcmp(ME.identifier, 'MATLAB:nomem')
        warning('outerinv no pudo ejecutarse por falta de memoria.');
    else
        warning('outerinv falló por otro motivo (%s): %s.', ...
                ME.identifier, ME.message);
    end
end

%Estimación de la inversa método pinv
[dur_pinv, pseudo_tpinv] = tpinv(A);
error_pseudo_tpinv = error_pseudoinversa_t(A,pseudo_tpinv);

texto = ['Errores mínimos y duración al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores1 = [error_pseudo_c, error_pseudo_soto, error_pseudo_grad, error_pseudo_out, error_pseudo_tpinv];
duracion1 = [dur_c, dur_soto, dur_grad, dur_out, dur_pinv];
col1 = {'Alg 5','IT', 'CGT', 'OQR','Tpinv'};
filas1 = {'Errores', 'Duración'};
format short
tabla5 = array2table([errores1;duracion1],'VariableNames',col1,'RowNames',filas1);
disp(tabla5)

