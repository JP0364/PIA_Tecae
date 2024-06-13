% Tecnicas Computacionales en Aeronautica
% AF 5 EDOs de frontera
% Victor Omar Rivera Valdez - 1908246
% Metodo de disparo y Diferencias Finitas

clear
clc
close all

disp('AF 5 EDOs de frontera');
disp('Alumno: Victor Omar Rivera Valdez');
disp('Matricula: 1908246');
disp(' ');

% Seleccion de la ED
EDO = input('Ingresar el numero de la EQ:');
disp(' ');

switch EDO
    case 1 % Problema Ejemplo
        u = 0.01;
        Ta = 20;
        f = @(x, y, z) z;
        g = @(x, y, z) u * (y - Ta);

    case 2 
        f = @(x, y, z) z;
        g = @(x, y, z) 0.15 * y;

    case 3 
        f = @(x, y, z) z;
        g = @(x, y, z) (2*z + y - x) / 8;
end

disp('Datos Introducidos: ');
disp(' ');
% x0 = input('Ingresar el valor de xi:');
% xf = input('Ingresar el valor de xf:'); 
% y0 = input('Ingresar el valor de inicial de frontera:');
% yf = input('Ingresar el valor de final de frontera:');   
% z0 = input('Ingresar el valor del primer disparo:');  
% h = input('Ingresar el tamaño del paso:');
x0 = 0;                               % x inicial
xf = 10;                              % x final
y0 = 40;                              % y0
yf = 200;                             % yf
% hp = 0.01;                            % Coef. de transferencia
h = 2;                            % Tamano de paso
z0 = 12.6;                              % Disparo inicial
% g = @(x,y,z) hp*(y-y0);               % Primera derivada
% f = @(x,y,z) z;                       % Segunda derivada
fprintf('\n')

%Valores para solucion analitica
x0_a = x0;
xf_a = xf;
y0_a = y0;
yf_a = yf;
h_a = h;

% Metodo de disparo
N = (xf - x0) / h;

y = zeros(1, N+1); y(1) = y0;
z = zeros(1, N+1); z(1) = z0;
x = x0:h:xf;




for i = 1:N
    k1 = f(x(i), y(i), z(i));
    l1 = g(x(i), y(i), z(i));
    k2 = f(x(i) + h/2, y(i) + k1 * h/2, z(i) + l1 * h/2);
    l2 = g(x(i) + h/2, y(i) + k1 * h/2, z(i) + l1 * h/2);
    k3 = f(x(i) + h/2, y(i) + k2 * h/2, z(i) + l2 * h/2);
    l3 = g(x(i) + h/2, y(i) + k2 * h/2, z(i) + l2 * h/2);
    k4 = f(x(i) + h, y(i) + k3 * h, z(i) + l3 * h);
    l4 = g(x(i) + h, y(i) + k3 * h, z(i) + l3 * h);

    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4) * h/6;
    z(i+1) = z(i) + (l1 + 2*l2 + 2*l3 + l4) * h/6;
end

% Grafica Metodo de disparo
figure;
hold on;
plot(x, y, 'DisplayName', 'Metodo de disparo');

y0 = 240
yf = 150
% Metodo de Diferencias Finitas
h = h
N_df = (xf - x0) / h - 1
x_df = linspace(x0 + h, xf - h, N_df)
A_df = zeros(N_df, N_df)
b_df = h^2 * .15 * ones(N_df, 1)

A_df(eye(size(A_df)) == 1) = 2 + h^2
A_df = A_df + diag(-1 * ones(N_df - 1, 1), 1) + diag(-1 * ones(N_df - 1, 1), -1)
b_df(1) = b_df(1) + y0
b_df(N_df) = b_df(N_df) + yf

T_df = A_df\b_df

% Transponer T_df para hacerlo un vector fila (horizontal)
T_df = T_df' % Ahora T_df es un vector fila

% Añadir condiciones de contorno a la solución en formato fila
T_df = [y0, T_df, yf]
x_df = [x0, x_df, xf]


%Soluciones Analiticas

% Calculo de la solución analítica para el caso 1
if EDO == 1
    % Definición de los parámetros para la solución analítica
    T1 = y0_a;
    T2 = yf_a;
    h_prime = h_a;
    L = xf - x0;  % Longitud de la barra

    % Función para calcular la solución analítica en cada punto x
    T_analytic = @(x) 73.4523 * exp(0.1 * x) - 53.4523 * exp(-0.1 * x) + Ta;

    % Cálculo de la solución analítica en los puntos x
    T_analytic_values = arrayfun(T_analytic, x);
end


% Grafica Metodo de Diferencias Finitas
plot(x_df, T_df, '--', 'DisplayName', 'Metodo de Diferencias Finitas');

% Finalizar la grafica
legend('show');
xlabel('x');
ylabel('y');
title('Comparación de Métodos: Disparo vs Diferencias Finitas');
grid on;


if EDO == 1
    % Graficar la solución analítica
    plot(x, T_analytic_values, '-.', 'DisplayName', 'Solución Analítica');
    % Finalizar la gráfica incluyendo la solución analítica
legend('show');
xlabel('x');
ylabel('T(x)');
title('Comparación de Métodos: Disparo vs Diferencias Finitas vs Analítica');
grid on;

end


% Imprimir vectores de soluciones en command window

disp('Vector x - Metodo de disparo:');
disp(x);
disp(' ');

disp('Vector y - Metodo de disparo:');
disp(y);
disp(' ');

disp('Vector T_df - Metodo de Diferencias Finitas:');
disp(T_df);
disp(' ');


% Imprimir la solución analítica si el caso es 1
if EDO == 1
    disp('Solución Analítica - Vector T_analytic:');
    disp(T_analytic_values);
    disp(' ');
end