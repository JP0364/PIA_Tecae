clear all 
clc
close all

fprintf(['0. (d2T/dx2)+h''(Ta-T)=0 (Temperatura),\tT(0)=40°C,\tT(10)=200°C,\th=2,\tz0=10 \n' ...
    '1. (d2T/dx2)-0.15T,\t\t\t\t\t\tt(0)=240,\tt(10)=150,\t\th=2,\tz0=-90 \n' ...
    '2. 7(d2T/dx2)-2(dT/dx)-y+x=0,\t\t\tt(0)=5,\t\tt(20)=8,\t\th=2,\tz0=-0.8 \n\n'])

validInput = 0;
while validInput==0
    Ec = input('Seleccione ecuacion a resolver, \nEscriba "0","1", o "2": ');
    
    % Switch - Case para seleccionar ecuacion
    switch Ec
        case 0
            x0 = 0;                               % x inicial
            xf = 10;                              % x final
            y0 = 40;                              % y0
            yf = 200;                             % yf
            h = 2;                                % Tamano de paso
            z0 = 12;                              % Disparo inicial
            fac = 0.1;                            % Factor para ajuste de disparo
            f = @(x,y,z) z;                       % Primera derivada
            g = @(x,y,z) 0.01*(y-20);             % Segunda derivada
            validInput = true;
        case 1
            x0 = 0;                               % x inicial
            xf = 10;                              % x final
            y0 = 240;                             % y0
            yf = 150;                             % yf
            h = 2;                                % Tamano de paso
            z0 = -90;                             % Disparo inicial
            fac = 0.01;                           % Factor para ajuste de disparo
            f = @(x,y,z) z;                       % Primera derivada
            g = @(x,y,z) 0.15*y;                  % Segunda derivada
            validInput = true;
        case 2
            x0 = 0;                               % x inicial
            xf = 20;                              % x final
            y0 = 5;                               % y0
            yf = 8;                               % yf
            h = 0.5;                                % Tamano de paso
            z0 = -0.8286;                             % Disparo inicial
            fac = 0.00001;                        % Factor para ajuste de disparo
            f = @(x,y,z) z;                       % Primera derivada
            g = @(x,y,z) (2*z+y-x)/7;             % Segunda derivada
            validInput = true;
        otherwise
            fprintf('\nEntrada no válida. Inténtelo de nuevo.\n');
    end
end
clear validInput;
clc
%% 

% % Vector x, tamano de vector x
% x = x0:h:xf;
% n = length(x);
% 
% N = n-2
% dx = h;
% N_df = (xf - x0) / dx - 1;
% x_df = linspace(x0 + dx, xf - dx, N_df);
% A_df = zeros(N_df, N_df);
% b_df = 0.01 * dx^2 * 20 * ones(N_df, 1);
% 
% A_df(eye(size(A_df)) == 1) = 2 + 0.01 * h^2
% A_df = A_df + diag(-1 * ones(N - 1, 1), 1) + diag(-1 * ones(N - 1, 1), -1)
% b_df(1) = 0.01 * h^2 * 20 + y0
% b_df(N) = 0.01 * h^2 * 20 + yf
% 
% T_df = A_df\b_df
% 
% % Transponer T_df para hacerlo un vector fila (horizontal)
% T_df = T_df' % Ahora T_df es un vector fila
% 
% % Añadir condiciones de contorno a la solución en formato fila
% T_df = [y0, T_df, yf]
% x_df = [x0, x_df, xf];
% 
% plot(x,T_df,'-x')
% 
% legend('Diferencias Finitas')
%% 


% % Define las funciones f y g fuera del switch, según cada caso.
% % Asumiendo que ya tienes f y g definidas para cada caso...
% 
% % Vector x y tamaño de vector x
x = x0:h:xf;
n = length(x);
% 
% dx = h;
% % Preparación de A_df y b_df
% N_df = (xf - x0) / dx - 1;
% x_df = linspace(x0 + dx, xf - dx, N_df);
% A_df = zeros(N_df, N_df);
% b_df = zeros(N_df, 1); % Ajustado para ser más genérico
% 
% % Llenar A_df y b_df
% for i = 1:N_df
%     A_df(i, i) = 2 + h^2 * g(x_df(i), 0, 0); % Ejemplo genérico, ajustar según g
%     if i > 1
%         A_df(i, i-1) = -1;
%         A_df(i-1, i) = -1;
%     end
%     b_df(i) = h^2 * f(x_df(i), 0, 0); % Ejemplo, ajustar según f y condiciones adicionales
% end
% 
% % Ajustar b_df con condiciones de contorno
% b_df(1) = b_df(1) + y0;
% b_df(end) = b_df(end) + yf;
% 
% % Resolver sistema
% T_df = A_df\b_df;
% 
% % Añadir condiciones de contorno a la solución
% T_df = [y0, T_df', yf]; % Asegúrate de que T_df sea un vector fila
% x_df = [x0, x_df, xf];
% 
% % Gráfica
% plot(x_df, T_df, '-x');
% legend('Diferencias Finitas');

%% 
N = n-2;
% Definir el espacio y pre-allocar A y b
x = linspace(x0, xf, N+2); % Incluye los bordes
dx = x(2) - x(1);
A = zeros(N,N);
b = zeros(N,1);

% Llenar la matriz A y el vector b según la ecuación seleccionada
for i = 1:N
    xi = x(i+1); % Ignorar el primer punto (condición de contorno)

    % Calcular p(xi) y q(xi) según la ecuación
    % Aquí es donde se diferencian las ecuaciones
    if Ec == 0
        p = 0; % No hay término con primera derivada
        q = 0.01*(20); % Adaptado a la primera ecuación
    elseif Ec == 1
        p = 0.15; % Adaptado a la segunda ecuación
        q = 0;
    elseif Ec == 2
        p = -2/(7*dx); % Término de primera derivada ajustado
        q = (xi + y - 2*z0/(7*dx^2)); % Adaptado a la tercera ecuación
    end
    
    % Llenar A
    A(i,i) = 2 + p*dx^2;
    if i > 1
        A(i,i-1) = -1;
    end
    if i < N
        A(i,i+1) = -1;
    end
    
    % Llenar b
    b(i) = q*dx^2;
end

% Ajustar b para las condiciones de contorno
b(1) = b(1) + y0;
b(N) = b(N) + yf;

% Resolver el sistema
T = A\b;

% Agregar las condiciones de contorno a la solución
T = [y0; T; yf];

% Crear el vector x completo
x_full = [x0, x(2:end-1), xf];

% Graficar
plot(x_full, T, '-x');
legend('Diferencias Finitas');

