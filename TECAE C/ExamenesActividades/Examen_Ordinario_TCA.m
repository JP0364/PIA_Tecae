%Tecnicas Computacionales en Aeronautica
%Examen Ordinario
%Victor Omar Rivera Valdez - 1908246

close all;
clear; clc;


%%
%Problema 1

fprintf('Problema 1 - Examen Ordinario\n')
fprintf('\nAlumno: Victor Omar Rivera Valdez\n')
fprintf('Matricula: 1908246  \n')
fprintf('\n')

% Dimensiones/Nodos en la placa
n = 5;
m = 5;

%Distancia entre nodos
delta_x = 1;
delta_y = 1;

% Inicializar la matriz de temperaturas
T = zeros(n, m);

% Condiciones de frontera
T(:, 1) = 200;  %Temperatura izquierda
T(1, :) = 0; %Temperatura Superior
T(:, m) = 100;  %Temperatura derecha
T(n, :) = 20;   %Temperatura inferior

% Parámetros del método
tolerancia = 0.01;
factor_relajacion = 1.2;
cambio_maximo = inf;

% Constante de conductividad térmica
k_prime = 0.492;

% Iteraciones del método de Liebmann
while cambio_maximo > tolerancia
    cambio_maximo = 0;
    for i = 2:n-1
        for j = 2:m-1
            T_viejo = T(i, j);
            T_nuevo = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            T(i, j) = T_viejo + factor_relajacion * (T_nuevo - T_viejo);

            % Calcular el cambio máximo
            cambio_actual = abs(T(i, j) - T_viejo);
            if cambio_actual > cambio_maximo
                cambio_maximo = cambio_actual;
            end
        end
    end
end

% Asumiendo que la matriz T contiene las temperaturas ya calculadas
[n, m] = size(T);
qx = zeros(n, m);
qy = zeros(n, m);
qr = zeros(n, m); % Matriz para el flujo de calor resultante
theta = zeros(n, m); % Matriz para los ángulos

% Calcular el flujo de calor usando diferencias finitas centradas
for i = 2:n-1
    for j = 2:m-1
        qx(i, j) = -k_prime * (T(i, j+1) - T(i, j-1)) / 2 * delta_x;
        qy(i, j) = -k_prime * (T(i+1, j) - T(i-1, j)) / 2 * delta_y;
        qr(i, j) = sqrt(qx(i, j)^2 + qy(i, j)^2);  % Calculo del flujo resultante
        theta(i, j) = atan2d(-qy(i, j), qx(i, j));  % Calculo del ángulo en grados
    end
end

% Ajustar los ángulos a un rango de 0 a 360 grados
theta_adjusted = mod(360 + theta, 360);

% Mostrar la matriz de temperaturas final
disp('Distribucion de Temperatura en la Placa:');
disp(' ');
disp(T);

%Flujo de calor
disp('Flujo de calor resultante (qr):');
disp(qr);

% Mostrar los angulos ajustados
disp('Problema 1:');
disp('Ángulos de trayectoria del flujo de calor (ajustados):');
disp(theta_adjusted);

% Graficar las temperaturas en una gráfica de colores
figure;
imagesc(T);
colorbar;
title('Problema 1 - Distribucion de temperaturas');
xlabel('x');
ylabel('y');
axis equal;

% Visualización de los flujos de calor usando gráficos de quiver
[X, Y] = meshgrid(1:m, 1:n);
figure;
quiver(X, Y, qx, qy);
title('Problema 1 - Trayectorias');
xlabel('x');
ylabel('y');
axis equal;
set(gca, 'YDir', 'reverse');  % Invertir la dirección del eje Y para que coincida con la gráfica de temperaturas


%%
% Problema 2

fprintf('Problema 2 - Examen Ordinario\n')
fprintf('\nAlumno: Victor Omar Rivera Valdez\n')
fprintf('Matricula: 1908246  \n')
fprintf('\n')

% Número de nodos y creación de temperaturas de frontera
nodos = 9;
t1 = linspace(25, 75, 3);
t2 = linspace(150, 50, 3);
t3 = linspace(0, 200, 5);
t4 = linspace(100, 0, 5);
n = sqrt(nodos);
mesh = zeros(n, n);

%Distancia entre nodos
delta_x = 1;
delta_y = 1;

% Crear la matriz de temperaturas con las condiciones de frontera
mesh1 = [t1', mesh, t2'];
T = [t3; mesh1; t4];

% Parámetros del método
tolerancia = 1e-2;
factor_relajacion = 1.2;
cambio_maximo = inf;

% Constante de conductividad térmica
k_prime = 0.492;

% Iteraciones del método de Liebmann
while cambio_maximo > tolerancia
    cambio_maximo = 0;
    for i = 2:n+1
        for j = 2:n+1
            T_viejo = T(i, j);

            T_arriba = T(i-1, j);
            T_abajo = T(i+1, j);
            T_derecha = T(i, j+1);
            T_izquierda = T(i, j-1);

            T_nuevo = (T_arriba + T_abajo + T_derecha + T_izquierda) / 4;
            T(i, j) = T_viejo + factor_relajacion * (T_nuevo - T_viejo);

            % Calcular el cambio máximo
            cambio_actual = abs(T(i, j) - T_viejo);
            if cambio_actual > cambio_maximo
                cambio_maximo = cambio_actual;
            end
        end
    end
end

% Asumiendo que la matriz T contiene las temperaturas ya calculadas
[n, m] = size(T);
qx = zeros(n, m);
qy = zeros(n, m);
qr = zeros(n, m); % Matriz para el flujo de calor resultante
theta = zeros(n, m); % Matriz para los ángulos

% Calcular el flujo de calor usando diferencias finitas centradas
for i = 2:n-1
    for j = 2:m-1
        qx(i, j) = -k_prime * (T(i, j+1) - T(i, j-1)) / 2 * delta_x;
        qy(i, j) = -k_prime * (T(i+1, j) - T(i-1, j)) / 2 * delta_y;
        qr(i, j) = sqrt(qx(i, j)^2 + qy(i, j)^2);  % Calculo del flujo resultante
        theta(i, j) = atan2d(-qy(i, j), qx(i, j));  % Calculo del ángulo en grados
    end
end

% Ajustar los ángulos a un rango de 0 a 360 grados
theta_adjusted = mod(360 + theta, 360);

% Mostrar la matriz de temperaturas final
disp('Problema 2 - Distribucion de Temperatura en la Placa:');
disp(' ');
disp(T);

%Flujo de calor
disp('Problema 2 - Flujo de calor resultante (qr):');
disp(qr);

% Mostrar los angulos ajustados
disp('Problema 2 - Ángulos de trayectoria del flujo de calor (ajustados):');
disp(theta_adjusted);

% Graficar las temperaturas en una gráfica de colores
figure;
imagesc(T);
colorbar;
title('Problema 2 - Distribucion de temperaturas');
xlabel('x');
ylabel('y');
axis equal;

% Visualización de los flujos de calor usando gráficos de quiver
[X, Y] = meshgrid(1:m, 1:n);
figure;
quiver(X, Y, qx, qy);
title('Problema 2 - Trayectorias');
xlabel('x');
ylabel('y');
axis equal;
set(gca, 'YDir', 'reverse');  % Invertir la dirección del eje Y para que coincida con la gráfica de temperaturas
axis equal;


