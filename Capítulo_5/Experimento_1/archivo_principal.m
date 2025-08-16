
%Experimento 1: Estimación de la pseudoinversa de un tensor tridimensional

%Capítulo 5

%Referencia:
% Tesis = Un enfoque alternativo par la aproximación de la pseudoinvera
%         tensorial y su aplicación en el procesamiento de imágenes y
%         videos

% Autor = Valverde-Sánchez, Samuel

% Maestría profesional en métodos matemáticos y aplicaciones (Universidad
% de Costa Rica)

clc; clear; close all
%% Estimación de la pseudoinversa tensorial para A1 de tamaño 200x300x20

% Parámetros iniciales
m = 200;
n = 300;
p = 20;
tol = 10^(-10); %tolerancia
MaxIter = 1000; % cantidad máxima de iteraciones

%Cálculo de iteraciones, errores y tiempos de ejecución para diferentes valores de s
[iteraciones2,errores2,duracion2] = cpseudo2(m,n,p,tol,2,MaxIter); %si s = 2
[iteraciones3,errores3,duracion3] = cpseudo2(m,n,p,tol,3,MaxIter); %si s = 3
[iteraciones4,errores4,duracion4] = cpseudo2(m,n,p,tol,4,MaxIter); %si s = 4
[iteraciones5,errores5,duracion5] = cpseudo2(m,n,p,tol,5,MaxIter); %si s = 5
[iteraciones8,errores8,duracion8] = cpseudo2(m,n,p,tol,8,MaxIter); %si s = 8
[iteraciones10,errores10,duracion10] = cpseudo2(m,n,p,tol,10,MaxIter); %si s = 10

texto = ['Iteraciones, duración y errores mínimos al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores = [errores2(end), errores3(end), errores4(end), errores5(end), errores8(end), errores10(end)];
iteraciones = [iteraciones2(end), iteraciones3(end), iteraciones4(end), iteraciones5(end), iteraciones8(end), iteraciones10(end)];
duraciones = [duracion2, duracion3, duracion4, duracion5, duracion8, duracion10];
col = {'s=2', 's=3', 's=4','s=5','s=8','s=10'};
filas = {'Iteraciones', 'Duración', 'Error mínimo'};
format short
tabla = array2table([iteraciones;duraciones;errores],'VariableNames',col,'RowNames',filas);
disp(tabla)

%Graficación de errores e iteraciones.
figure(1)
plot(iteraciones2,errores2,'*-r','LineWidth',2,'MarkerSize',6)
hold on
plot(iteraciones3,errores3,'*-g','LineWidth',2,'MarkerSize',6)
plot(iteraciones4,errores4,'*-b','LineWidth',2,'MarkerSize',6)
plot(iteraciones5,errores5,'*-c','LineWidth',2,'MarkerSize',6)
plot(iteraciones8,errores8,'*-m','LineWidth',2,'MarkerSize',6)
plot(iteraciones10,errores10,'*-y','LineWidth',2,'MarkerSize',6)
xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title('Gráfica de iteraciones y errores (tensor A1 tamaño 200x300x20)')
legend('s=2', 's=3','s=4','s=5','s=8','s=10','Location', 'northeast')
hold off

%% Estimación de la pseudoinversa tensorial para A2 de tamaño 400x200x20

% Parámetros iniciales
m = 400;
n = 200;
p = 20;


%Cálculo de iteraciones, errores y tiempos de ejecución para diferentes valores de s
[iteraciones2,errores2,duracion2] = cpseudo2(m,n,p,tol,2,MaxIter); %si s = 2
[iteraciones3,errores3,duracion3] = cpseudo2(m,n,p,tol,3,MaxIter); %si s = 3
[iteraciones4,errores4,duracion4] = cpseudo2(m,n,p,tol,4,MaxIter); %si s = 4
[iteraciones5,errores5,duracion5] = cpseudo2(m,n,p,tol,5,MaxIter); %si s = 5
[iteraciones8,errores8,duracion8] = cpseudo2(m,n,p,tol,8,MaxIter); %si s = 8
[iteraciones10,errores10,duracion10] = cpseudo2(m,n,p,tol,10,MaxIter); %si s = 10

texto = ['Iteraciones, duración y errores mínimos al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores = [errores2(end), errores3(end), errores4(end), errores5(end), errores8(end), errores10(end)];
iteraciones = [iteraciones2(end), iteraciones3(end), iteraciones4(end), iteraciones5(end), iteraciones8(end), iteraciones10(end)];
duraciones = [duracion2, duracion3, duracion4, duracion5, duracion8, duracion10];
col = {'s=2', 's=3', 's=4','s=5','s=8','s=10'};
filas = {'Iteraciones', 'Duración', 'Error mínimo'};
format short
tabla = array2table([iteraciones;duraciones;errores],'VariableNames',col,'RowNames',filas);
disp(tabla)

%Graficación de errores e iteraciones.
figure(2)
plot(iteraciones2,errores2,'*-r','LineWidth',2,'MarkerSize',6)
hold on
plot(iteraciones3,errores3,'*-g','LineWidth',2,'MarkerSize',6)
plot(iteraciones4,errores4,'*-b','LineWidth',2,'MarkerSize',6)
plot(iteraciones5,errores5,'*-c','LineWidth',2,'MarkerSize',6)
plot(iteraciones8,errores8,'*-m','LineWidth',2,'MarkerSize',6)
plot(iteraciones10,errores10,'*-y','LineWidth',2,'MarkerSize',6)
xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title('Gráfica de iteraciones y errores (tensor A2 tamaño 400x200x20)')
legend('s=2', 's=3','s=4','s=5','s=8','s=10','Location', 'northeast')
hold off

%% Estimación de la pseudoinversa tensorial para A3 de tamaño 500x300x20

% Parámetros iniciales
m = 500;
n = 300;
p = 20;


%Cálculo de iteraciones, errores y tiempos de ejecución para diferentes valores de s
[iteraciones2,errores2,duracion2] = cpseudo2(m,n,p,tol,2,MaxIter); %si s = 2
[iteraciones3,errores3,duracion3] = cpseudo2(m,n,p,tol,3,MaxIter); %si s = 3
[iteraciones4,errores4,duracion4] = cpseudo2(m,n,p,tol,4,MaxIter); %si s = 4
[iteraciones5,errores5,duracion5] = cpseudo2(m,n,p,tol,5,MaxIter); %si s = 5
[iteraciones8,errores8,duracion8] = cpseudo2(m,n,p,tol,8,MaxIter); %si s = 8
[iteraciones10,errores10,duracion10] = cpseudo2(m,n,p,tol,10,MaxIter); %si s = 10

texto = ['Iteraciones, duración y errores mínimos al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores = [errores2(end), errores3(end), errores4(end), errores5(end), errores8(end), errores10(end)];
iteraciones = [iteraciones2(end), iteraciones3(end), iteraciones4(end), iteraciones5(end), iteraciones8(end), iteraciones10(end)];
duraciones = [duracion2, duracion3, duracion4, duracion5, duracion8, duracion10];
col = {'s=2', 's=3', 's=4','s=5','s=8','s=10'};
filas = {'Iteraciones', 'Duración', 'Error mínimo'};
format short
tabla = array2table([iteraciones;duraciones;errores],'VariableNames',col,'RowNames',filas);
disp(tabla)

%Graficación de errores e iteraciones.
figure(3)
plot(iteraciones2,errores2,'*-r','LineWidth',2,'MarkerSize',6)
hold on
plot(iteraciones3,errores3,'*-g','LineWidth',2,'MarkerSize',6)
plot(iteraciones4,errores4,'*-b','LineWidth',2,'MarkerSize',6)
plot(iteraciones5,errores5,'*-c','LineWidth',2,'MarkerSize',6)
plot(iteraciones8,errores8,'*-m','LineWidth',2,'MarkerSize',6)
plot(iteraciones10,errores10,'*-y','LineWidth',2,'MarkerSize',6)
xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title('Gráfica de iteraciones y errores (tensor A3 tamaño 500x300x20)')
legend('s=2', 's=3','s=4','s=5','s=8','s=10','Location', 'northeast')
hold off

%% Estimación de la pseudoinversa tensorial para A4 de tamaño 400x800x20

% Parámetros iniciales
m = 400;
n = 800;
p = 20;


%Cálculo de iteraciones, errores y tiempos de ejecución para diferentes valores de s
[iteraciones2,errores2,duracion2] = cpseudo2(m,n,p,tol,2,MaxIter); %si s = 2
[iteraciones3,errores3,duracion3] = cpseudo2(m,n,p,tol,3,MaxIter); %si s = 3
[iteraciones4,errores4,duracion4] = cpseudo2(m,n,p,tol,4,MaxIter); %si s = 4
[iteraciones5,errores5,duracion5] = cpseudo2(m,n,p,tol,5,MaxIter); %si s = 5
[iteraciones8,errores8,duracion8] = cpseudo2(m,n,p,tol,8,MaxIter); %si s = 8
[iteraciones10,errores10,duracion10] = cpseudo2(m,n,p,tol,10,MaxIter); %si s = 10

texto = ['Iteraciones, duración y errores mínimos al estimar la pseudoinversa del tensor de tamaño ', num2str(m), ' x ', num2str(n), ' x ', num2str(p)];
disp(texto)

disp(' ')

%Confección de la tabla con número de iteraciones, errores y tiempos de ejecución calculados anteriormente.
errores = [errores2(end), errores3(end), errores4(end), errores5(end), errores8(end), errores10(end)];
iteraciones = [iteraciones2(end), iteraciones3(end), iteraciones4(end), iteraciones5(end), iteraciones8(end), iteraciones10(end)];
duraciones = [duracion2, duracion3, duracion4, duracion5, duracion8, duracion10];
col = {'s=2', 's=3', 's=4','s=5','s=8','s=10'};
filas = {'Iteraciones', 'Duración', 'Error mínimo'};
format short
tabla = array2table([iteraciones;duraciones;errores],'VariableNames',col,'RowNames',filas);
disp(tabla)

%Graficación de errores e iteraciones.
figure(4)
plot(iteraciones2,errores2,'*-r','LineWidth',2,'MarkerSize',6)
hold on
plot(iteraciones3,errores3,'*-g','LineWidth',2,'MarkerSize',6)
plot(iteraciones4,errores4,'*-b','LineWidth',2,'MarkerSize',6)
plot(iteraciones5,errores5,'*-c','LineWidth',2,'MarkerSize',6)
plot(iteraciones8,errores8,'*-m','LineWidth',2,'MarkerSize',6)
plot(iteraciones10,errores10,'*-y','LineWidth',2,'MarkerSize',6)
xlabel('Iteraciones')
ylabel('Errores')
set(gca,'fontsize',12)
title('Gráfica de iteraciones y errores (tensor A4 tamaño 400x800x20)')
legend('s=2', 's=3','s=4','s=5','s=8','s=10','Location', 'northeast')
hold off