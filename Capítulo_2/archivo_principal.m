
%Comparación numérica de los métodos iterativos

%Capítulo 2

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos

% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all
%% Estimación de la pseudoinversa matricial para la matriz A1 tamaño 500x500

% Parámetros iniciales
m = 500;
n = 500;
A = randn(m,n); %crea una matriz aleatoria de tamaño m x n con números en el intervalo [0,1]
 tol = 10^(-10);

% Cálculo de la pseudoinversa mediante el método de Newton - Schulz
StartS = tic; 
[lschulz,eschulz,pschulz] = schulz(A,m,tol);
EndS = toc(StartS);

% Cálculo de la pseudoinversa mediante el método de Chebyshev
StartC = tic; 
[lchev,echev,pchev] = chev(A,m,tol);
EndC = toc(StartC);

% Cálculo de la pseudoinversa mediante el método de Kaur
StartK = tic; 
[lkaur,ekaur,pkaur] = kaur(A,m,tol);
EndK = toc(StartK);

% Cálculo de la pseudoinversa mediante el método de hiperpotencias con s = 3
StartH = tic; 
[lhiper,ehiper,phiper] = hiper(A,m,tol);
EndH = toc(StartH);

% Cálculo de la pseudoinversa mediante el método de Li y Li cuando s = 4
StartL = tic; 
[lli,eli,pli] = Li(A,m,tol);
EndL = toc(StartL);

texto = ['Tiempos de ejecución al estimar la pseudoinversa de la matriz de tamaño ', num2str(m), ' x ', num2str(n)];
disp(texto)

disp(' ')

% Tabla resumen de tiempos de ejecución
duracion1 = [EndS, EndC, EndL, EndK, EndH];

col1  = {'Schulz', 'Chebyshev', 'Li y Li', 'Kaur', 'Hiperpotencias'};
filas1 = {'Duración'};

format short
tabla_tiempos = array2table(duracion1, ...
                            'VariableNames', col1, ...
                            'RowNames',    filas1);

disp(tabla_tiempos)

disp(' ')

disp(' ')

% Graficación de errores e iteraciones
figure(1)
plot(lschulz,eschulz,'*-g','LineWidth',2,'MarkerSize',6)   % NS
hold on
plot(lchev,echev,'*-b','LineWidth',2,'MarkerSize',6)       % CB
plot(lli,eli,'*-m','LineWidth',2,'MarkerSize',6)           % LL
plot(lkaur,ekaur,'*-r','LineWidth',2,'MarkerSize',6)       % KR
plot(lhiper,ehiper,'*-k','LineWidth',2,'MarkerSize',6)     % HIP

xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title(['Gráfica de iteraciones y errores (matriz A tamaño ' num2str(m) 'x' num2str(n) ')'])
legend('NS', 'CB', 'LL', 'KR', 'HIP', 'Location', 'northeast')
grid on
hold off

%% Estimación de la pseudoinversa matricial para la matriz A2 tamaño 1000x1500

% Parámetros iniciales
m = 1000;
n = 1500;
A = randn(m,n); %crea una matriz aleatoria de tamaño m x n con números en el intervalo [0,1]

% Cálculo de la pseudoinversa mediante el método de Newton - Schulz
StartS = tic; 
[lschulz,eschulz,pschulz] = schulz(A,m,tol);
EndS = toc(StartS);

% Cálculo de la pseudoinversa mediante el método de Chebyshev
StartC = tic; 
[lchev,echev,pchev] = chev(A,m,tol);
EndC = toc(StartC);

% Cálculo de la pseudoinversa mediante el método de Kaur
StartK = tic; 
[lkaur,ekaur,pkaur] = kaur(A,m,tol);
EndK = toc(StartK);

% Cálculo de la pseudoinversa mediante el método de hiperpotencias con s = 3
StartH = tic; 
[lhiper,ehiper,phiper] = hiper(A,m,tol);
EndH = toc(StartH);

% Cálculo de la pseudoinversa mediante el método de Li y Li cuando s = 4
StartL = tic; 
[lli,eli,pli] = Li(A,m,tol);
EndL = toc(StartL);


texto = ['Tiempos de ejecución al estimar la pseudoinversa de la matriz de tamaño ', num2str(m), ' x ', num2str(n)];
disp(texto)

disp(' ')

% Tabla resumen de tiempos de ejecución
duracion1 = [EndS, EndC, EndL, EndK, EndH];

col1  = {'Schulz', 'Chebyshev', 'Li y Li', 'Kaur', 'Hiperpotencias'};
filas1 = {'Duración'};

format short
tabla_tiempos = array2table(duracion1, ...
                            'VariableNames', col1, ...
                            'RowNames',    filas1);

disp(tabla_tiempos)

disp(' ')

disp(' ')

% Graficación de errores e iteraciones
figure(2)
plot(lschulz,eschulz,'*-g','LineWidth',2,'MarkerSize',6)   % NS
hold on
plot(lchev,echev,'*-b','LineWidth',2,'MarkerSize',6)       % CB
plot(lli,eli,'*-m','LineWidth',2,'MarkerSize',6)           % LL
plot(lkaur,ekaur,'*-r','LineWidth',2,'MarkerSize',6)       % KR
plot(lhiper,ehiper,'*-k','LineWidth',2,'MarkerSize',6)     % HIP

xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title(['Gráfica de iteraciones y errores (matriz A tamaño ' num2str(m) 'x' num2str(n) ')'])
legend('NS', 'CB', 'LL', 'KR', 'HIP', 'Location', 'northeast')
grid on
hold off

%% Estimación de la pseudoinversa matricial para la matriz A3 tamaño 3000x2000

% Parámetros iniciales
m = 3000;
n = 2000;
A = randn(m,n); %crea una matriz aleatoria de tamaño m x n con números en el intervalo [0,1]

% Cálculo de la pseudoinversa mediante el método de Newton - Schulz
StartS = tic; 
[lschulz,eschulz,pschulz] = schulz(A,m,tol);
EndS = toc(StartS);

% Cálculo de la pseudoinversa mediante el método de Chebyshev
StartC = tic; 
[lchev,echev,pchev] = chev(A,m,tol);
EndC = toc(StartC);

% Cálculo de la pseudoinversa mediante el método de Kaur
StartK = tic; 
[lkaur,ekaur,pkaur] = kaur(A,m,tol);
EndK = toc(StartK);

% Cálculo de la pseudoinversa mediante el método de hiperpotencias con s = 3
StartH = tic; 
[lhiper,ehiper,phiper] = hiper(A,m,tol);
EndH = toc(StartH);

% Cálculo de la pseudoinversa mediante el método de Li y Li cuando s = 4
StartL = tic; 
[lli,eli,pli] = Li(A,m,tol);
EndL = toc(StartL);


texto = ['Tiempos de ejecución al estimar la pseudoinversa de la matriz de tamaño ', num2str(m), ' x ', num2str(n)];
disp(texto)

disp(' ')

% Tabla resumen de tiempos de ejecución
duracion1 = [EndS, EndC, EndL, EndK, EndH];

col1  = {'Schulz', 'Chebyshev', 'Li y Li', 'Kaur', 'Hiperpotencias'};
filas1 = {'Duración'};

format short
tabla_tiempos = array2table(duracion1, ...
                            'VariableNames', col1, ...
                            'RowNames',    filas1);

disp(tabla_tiempos)

% Graficación de errores e iteraciones
figure(3)
plot(lschulz,eschulz,'*-g','LineWidth',2,'MarkerSize',6)   % NS
hold on
plot(lchev,echev,'*-b','LineWidth',2,'MarkerSize',6)       % CB
plot(lli,eli,'*-m','LineWidth',2,'MarkerSize',6)           % LL
plot(lkaur,ekaur,'*-r','LineWidth',2,'MarkerSize',6)       % KR
plot(lhiper,ehiper,'*-k','LineWidth',2,'MarkerSize',6)     % HIP

xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title(['Gráfica de iteraciones y errores (matriz A tamaño ' num2str(m) 'x' num2str(n) ')'])
legend('NS', 'CB', 'LL', 'KR', 'HIP', 'Location', 'northeast')
grid on
hold off
