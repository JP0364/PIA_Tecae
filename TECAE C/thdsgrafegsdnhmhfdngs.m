clear all
close all
clc

% Parámetros
L = 30; % Longitud del resorte (m)
m = 68.1; % Masa del objeto (kg)
Cd = 0.25; % Coeficiente de arrastre
k = 40; % Constante del resorte (N/m)
g = 9.81; % Aceleración debido a la gravedad (m/s^2)
c = 8; % Coeficiente de amortiguamiento (Ns/m)
h = 0.01; % Paso de tiempo (s)

% Inicial
x = 0; % Posición inicial (m)
v = 0; % Velocidad inicial (m/s)
X = x; % Vector para almacenar las posiciones
V = v; % Vector para almacenar las velocidades
T = 0:h:100; % Vector de tiempo
oscilacionMenorA05 = false; % Flag para detectar la oscilación menor a 0.5m
tiempoOscilacionMenorA05 = NaN; % Tiempo cuando la oscilación es menor a 0.5m

% Aceleración
a = @(x, v) g - (Cd/m) * abs(v) * v;

% Runge-Kutta 4 method for numerical integration
for ti = T(2:end)
    % Calculate acceleration at current position and velocity
    a = @(x, v) g - (Cd/m) * abs(v) * v - (x > L) * ((k/m) * (x - L) + (c/m) * v);

    % Calculate k values for x and v
    k1x = h * v;
    k1v = h * a(x, v);
    k2x = h * (v + 0.5*k1v);
    k2v = h * a(x + 0.5*k1x, v + 0.5*k1v);
    k3x = h * (v + 0.5*k2v);
    k3v = h * a(x + 0.5*k2x, v + 0.5*k2v);
    k4x = h * (v + k3v);
    k4v = h * a(x + k3x, v + k3v);

    % Calculate new position and velocity using the k values
    x_new = x + (k1x + 2*k2x + 2*k3x + k4x) / 6;
    v_new = v + (k1v + 2*k2v + 2*k3v + k4v) / 6;

    % Check if the oscillation is smaller than 0.5m
    if abs(x_new - x) < 0.5 && ~oscilacionMenorA05
        oscilacionMenorA05 = true;
        tiempoOscilacionMenorA05 = ti;
    end

    % Update position and velocity
    x = x_new;
    v = v_new;

    % Store positions and velocities in vectors
    X = [X, x];
    V = [V, v];
end

% Plot
figure; plot(T, -X, 'LineWidth', 2); grid on; hold on;
plot(T, V, 'LineWidth', 2); xlabel('t (s)'); ylabel('x (m) / v (m/s)');
title('x & v vs. t'); legend('x', 'v'); hold off;

if oscilacionMenorA05
    fprintf('La posición tuvo una oscilación menor a 0.5m por primera vez en t = %f segundos.\n', tiempoOscilacionMenorA05);
else
    fprintf('La posición no tuvo una oscilación menor a 0.5m.\n');
end

