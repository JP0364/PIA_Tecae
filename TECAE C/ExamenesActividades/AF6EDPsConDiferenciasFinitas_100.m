%                                           %%
% Jesus Antonio Ramirez Alpizar - 2077851   %%
% Tecnicas Computacionales en Aeronautica 1 %%
% Actividad Fundamental 6                   %%
% 1 de mayo de 2024                         %%
%                                           %%

%% Problema 6.1 %%
 % Usa el metodo de Liebmann para resolver cual sería la temperatura de la
 % placa cuadrada calentada de la figura 1, pero con la condicion de
 % frontera superior incrementada a 120º y la frontera izquierda disminuida
 % a 60ºC. Utiliza un factor de relajamiento de 1.2 para iterar hasta que
 % el error sea del 1%.

clear all
close all
clc

n = 3;       % Numero de puntos en la direccion x en la malla

Tlw = 0;     % Valor del borde inferior
Tlf = 60;    % Valor del borde izquierdo
Tup = 120;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);
A_container = A;
A(end, 2:end-1) = Tlw; A(2:end-1, 1) = Tlf;
A(1, 2:end-1) = Tup; A(2:end-1, end) = Trg;

err_val = 100;
iteration = 0;
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j); % Para calculos de peso y error
            A(i, j) = (A(i+1, j)+A(i-1, j)+A(i, j+1)+A(i, j-1))/4;
            A(i, j) = w*A(i, j) + (1-w)*A_container(i, j);
        end
    end
    Err_A = 100*abs((A(2:end-1, 2:end-1)-A_container(2:end-1, 2:end-1))...
        ./A(2:end-1, 2:end-1)); % Matriz de error
    err_val = max(Err_A(:)); % Valor maximo de error
    iteration = iteration + 1;
end
T = A; % Esto se usara para calcular el flujo de calor, no es necesario para la distribucion de temperatura.
fprintf('Numero de iteraciones :%d\n', iteration);
fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1)

% Grafico de la matriz de temperatura
figure; % Abre una nueva ventana de figura
imagesc(M); % Crea un grafico codificado por colores de la matriz
colormap(jet); % Establece el mapa de colores a 'jet' para un gradiente de color
colorbar; % Muestra una barra de colores en el lado del grafico
title('Distribucion de temperatura'); % Agrega un titulo al grafico
xlabel('Direccion X'); % Etiqueta para el eje x
ylabel('Direccion Y'); % Etiqueta para el eje y

%% Problema 6.2 %%
 % Repite el ejemplo 6.1, pero emplea 49 nodos interiores
 % (es decir, Δx = Δy = 5 cm).

clear all
close all
clc

n = 49;       % Numero de puntos en la direccion x en la malla

Tlw = 0;     % Valor del borde inferior
Tlf = 60;    % Valor del borde izquierdo
Tup = 120;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);
A_container = A;
A(end, 2:end-1) = Tlw; A(2:end-1, 1) = Tlf;
A(1, 2:end-1) = Tup; A(2:end-1, end) = Trg;

err_val = 100;
iteration = 0;
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j); % Para calculos de peso y error
            A(i, j) = (A(i+1, j)+A(i-1, j)+A(i, j+1)+A(i, j-1))/4;
            A(i, j) = w*A(i, j) + (1-w)*A_container(i, j);
        end
    end
    Err_A = 100*abs((A(2:end-1, 2:end-1)-A_container(2:end-1, 2:end-1))...
        ./A(2:end-1, 2:end-1)); % Matriz de error
    err_val = max(Err_A(:)); % Valor maximo de error
    iteration = iteration + 1;
end
T = A; % Esto se usara para calcular el flujo de calor, no es necesario para la distribucion de temperatura.
fprintf('Numero de iteraciones :%d\n', iteration);
fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1)

% Grafico de la matriz de temperatura
figure; % Abre una nueva ventana de figura
imagesc(M); % Crea un grafico codificado por colores de la matriz
colormap(jet); % Establece el mapa de colores a 'jet' para un gradiente de color
colorbar; % Muestra una barra de colores en el lado del grafico
title('Distribucion de temperatura'); % Agrega un titulo al grafico
xlabel('Direccion X'); % Etiqueta para el eje x
ylabel('Direccion Y'); % Etiqueta para el eje y

%% Problema 6.3 %%
% Calcule los flujos para el problema 6.1 con el uso de los parametros del
% problema 6.2


clear all
close all
clc

n = 10;       % Numero de puntos en la direccion x en la malla

Tlw = 0;     % Valor del borde inferior
Tlf = 120;    % Valor del borde izquierdo
Tup = 240;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % Factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);
A_container = A;
A(end, 2:end-1) = Tlw; 
A(2:end-1, 1) = Tlf;
A(1, 2:end-1) = Tup; 
A(2:end-1, end) = Trg;

err_val = 100;
iteration = 0;
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j); % Para calculos de peso y error
            A(i, j) = (A(i+1, j)+A(i-1, j)+A(i, j+1)+A(i, j-1))/4;
            A(i, j) = w*A(i, j) + (1-w)*A_container(i, j);
        end
    end
    Err_A = 100*abs((A(2:end-1, 2:end-1)-A_container(2:end-1, 2:end-1))...
        ./A(2:end-1, 2:end-1)); % Matriz de error
    err_val = max(Err_A(:)); % Valor maximo de error
    iteration = iteration + 1;
end
% fprintf('Numero de iteraciones: %d\n', iteration);
% fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1);

% Cálculo de flujos de calor usando diferencias finitas centradas
[dy, dx] = gradient(rot90(M));
flux_x = dx; % Flujo de calor en la dirección x
flux_y = dy; % Flujo de calor en la dirección y


% Grafico de los flujos de calor
figure;
quiver(flux_x, flux_y);
title('Flujo de calor');
xlabel('Direccion X');
ylabel('Direccion Y');

n = 80;       % Numero de puntos en la direccion x en la malla

Tlw = 0;     % Valor del borde inferior
Tlf = 120;    % Valor del borde izquierdo
Tup = 240;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);
A_container = A;
A(end, 2:end-1) = Tlw; A(2:end-1, 1) = Tlf;
A(1, 2:end-1) = Tup; A(2:end-1, end) = Trg;

err_val = 100;
iteration = 0;
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j); % Para calculos de peso y error
            A(i, j) = (A(i+1, j)+A(i-1, j)+A(i, j+1)+A(i, j-1))/4;
            A(i, j) = w*A(i, j) + (1-w)*A_container(i, j);
        end
    end
    Err_A = 100*abs((A(2:end-1, 2:end-1)-A_container(2:end-1, 2:end-1))...
        ./A(2:end-1, 2:end-1)); % Matriz de error
    err_val = max(Err_A(:)); % Valor maximo de error
    iteration = iteration + 1;
end
T = A; % Esto se usara para calcular el flujo de calor, no es necesario para la distribucion de temperatura.
fprintf('Numero de iteraciones :%d\n', iteration);
fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1)


% Grafico de la matriz de temperatura
figure; % Abre una nueva ventana de figura
imagesc(M); % Crea un grafico codificado por colores de la matriz
colormap(jet); % Establece el mapa de colores a 'jet' para un gradiente de color
colorbar; % Muestra una barra de colores en el lado del grafico
title('Distribucion de temperatura'); % Agrega un titulo al grafico
xlabel('Direccion X'); % Etiqueta para el eje x
ylabel('Direccion Y'); % Etiqueta para el eje y

%% Problema 6.4
 % Vuelva a hacer el problema 6.2, pero con el caso extremo inferior está
 % aislado

 clear all
 close all
 clc

 n = 49;       % Numero de puntos en la direccion x en la malla

Tlf = 60;    % Valor del borde izquierdo
Tup = 120;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);
A_container = A;
A(1, 2:end-1) = Tup; A(2:end-1, 1) = Tlf;
A(2:end-1, end) = Trg;

err_val = 100;
iteration = 0;
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j); % Para calculos de peso y error
            if i == n+2-1 % Borde inferior
                A(i, j) = A(i-1, j); % Condición de aislamiento: sin cambio de temperatura en el borde
            else
                A(i, j) = (A(i+1, j)+A(i-1, j)+A(i, j+1)+A(i, j-1))/4;
            end
            A(i, j) = w*A(i, j) + (1-w)*A_container(i, j);
        end
    end
    Err_A = 100*abs((A(2:end-1, 2:end-1)-A_container(2:end-1, 2:end-1))...
        ./A(2:end-1, 2:end-1)); % Matriz de error
    err_val = max(Err_A(:)); % Valor maximo de error
    iteration = iteration + 1;
end
T = A; % Esto se usara para calcular el flujo de calor, no es necesario para la distribucion de temperatura.
fprintf('Numero de iteraciones :%d\n', iteration);
fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1)

% Grafico de la matriz de temperatura
figure; % Abre una nueva ventana de figura
imagesc(M); % Crea un grafico codificado por colores de la matriz
colormap(jet); % Establece el mapa de colores a 'jet' para un gradiente de color
colorbar; % Muestra una barra de colores en el lado del grafico
title('Distribucion de temperatura'); % Agrega un titulo al grafico
xlabel('Direccion X'); % Etiqueta para el eje x
ylabel('Direccion Y'); % Etiqueta para el eje y


%% Problema 6.5 %%
 % Con excepcion de las condiciones de frontera, la placa de la figura 2
 % tiene las mismas caracteristicas que la que se uso en el problema 6.1.
 % Para dicha placa, simule tanto las temperaturas como los flujos

 clear all
 close all
 clc

 n = 49;       % Numero de puntos en la direccion x en la malla

Tlf = 60;    % Valor inicial del borde izquierdo, ya no se usará directamente
Tup = 120;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);  % Matriz de temperatura incluyendo los bordes
A_container = A;  % Contenedor para la temperatura anterior
A(1, 2:end-1) = Tup;  % Configuración de temperatura en el borde superior
A(2:end-1, end) = Trg;  % Configuración de temperatura en el borde derecho

err_val = 100;  % Inicialización del valor de error
iteration = 0;  % Contador de iteraciones
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j);  % Guarda el estado actual para cálculos
            if i == n+2-1  % Condición de aislamiento en el borde inferior
                A(i, j) = A(i-1, j);  % Propaga la temperatura del nodo interior
            elseif j == 2  % Condición de aislamiento en el borde izquierdo
                A(i, j) = A(i, j+1);  % Propaga la temperatura del nodo a la derecha
            else
                A(i, j) = (A(i+1, j) + A(i-1, j) + A(i, j+1) + A(i, j-1)) / 4;
            end
            A(i, j) = w * A(i, j) + (1 - w) * A_container(i, j);  % Sobre-relajación
        end
    end
    Err_A = 100 * abs((A(2:end-1, 2:end-1) - A_container(2:end-1, 2:end-1)) ./ A(2:end-1, 2:end-1));  % Matriz de error
    err_val = max(Err_A(:));  % Valor máximo de error encontrado
    iteration = iteration + 1;  % Incremento del contador de iteraciones
end

T = A;  % Asignación final de la matriz de temperatura
fprintf('Numero de iteraciones :%d\n', iteration);
fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1)  % Extracción de la matriz de temperatura sin los bordes

% Grafico de la matriz de temperatura
figure;
imagesc(M);  % Visualización de la matriz de temperatura
colormap(jet);  % Uso del mapa de colores tipo 'jet'
colorbar;  % Barra de colores para referencia
title('Distribucion de temperatura');
xlabel('Direccion X');
ylabel('Direccion Y');



 n = 8;       % Numero de puntos en la direccion x en la malla

Tlf = 60;    % Valor inicial del borde izquierdo, ya no se usará directamente
Tup = 120;   % Valor del borde superior
Trg = 50;    % Valor del borde derecho
w   = 1.2;   % factor de ponderacion de sobrerrelajacion
err = 1;     % Valor maximo de error permitido en porcentaje

A = zeros(n+2, n+2);  % Matriz de temperatura incluyendo los bordes
A_container = A;  % Contenedor para la temperatura anterior
A(1, 2:end-1) = Tup;  % Configuración de temperatura en el borde superior
A(2:end-1, end) = Trg;  % Configuración de temperatura en el borde derecho

err_val = 100;  % Inicialización del valor de error
iteration = 0;  % Contador de iteraciones
while err_val >= err
    for i = n+2-1:-1:2
        for j = 2:n+2-1
            A_container(i, j) = A(i, j);  % Guarda el estado actual para cálculos
            if i == n+2-1  % Condición de aislamiento en el borde inferior
                A(i, j) = A(i-1, j);  % Propaga la temperatura del nodo interior
            elseif j == 2  % Condición de aislamiento en el borde izquierdo
                A(i, j) = A(i, j+1);  % Propaga la temperatura del nodo a la derecha
            else
                A(i, j) = (A(i+1, j) + A(i-1, j) + A(i, j+1) + A(i, j-1)) / 4;
            end
            A(i, j) = w * A(i, j) + (1 - w) * A_container(i, j);  % Sobre-relajación
        end
    end
    Err_A = 100 * abs((A(2:end-1, 2:end-1) - A_container(2:end-1, 2:end-1)) ./ A(2:end-1, 2:end-1));  % Matriz de error
    err_val = max(Err_A(:));  % Valor máximo de error encontrado
    iteration = iteration + 1;  % Incremento del contador de iteraciones
end

T = A;  % Asignación final de la matriz de temperatura
fprintf('Numero de iteraciones :%d\n', iteration);
fprintf('Los valores de temperatura son:\n');
M = A(2:end-1, 2:end-1)  % Extracción de la matriz de temperatura sin los bordes

% Cálculo de flujos de calor usando diferencias finitas centradas
[dy, dx] = gradient(M);
flux_x = -dx; % Flujo de calor en la dirección x
flux_y = -dy; % Flujo de calor en la dirección y

% Grafico de los flujos de calor
figure;
quiver(flux_x, flux_y);
title('Flujo de calor');
xlabel('Direccion X');
ylabel('Direccion Y');

 %                                             %%
 % Jesus Antonio Ramirez Alpizar - 2077851     %%
 % Tecnicas Computacionales en Aeronautica 1   %%
 % Actividad Fundamental 6                     %%
 % 1 de mayo de 2024                           %%
 %                                             %%