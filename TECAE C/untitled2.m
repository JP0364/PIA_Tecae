clear
clc
close all
 
fprintf('Examen de medio curso - Problema 2\n')
fprintf('\nAlumno: Victor Omar Rivera Valdez\n')
fprintf('Matricula: 1908246 \n')
 
%Parametros iniciales
m0 = 2000;
T = 49050;
p0 = 1.225;
CD = 0.4;
A = 30.5;
g = 9.81;
h0 = 1000;
V0 = 61.29;
delta_t = 0.01;
 
 
% Funciones
p = @(h) p0 * exp(-h / 7640);
D = @(V, h) 0.5 * p(h) * A * V^2 * CD;
t = 0;
h = h0;
V = V0;
m = m0;
ts = t;
hs = h;
Vs = V;
As = 0;
 
while h > 0
    m = max(m0 - 30*t, 400);
    if m > 400
        F_net = T - D(V, h) - m*g;
    elseif V > 0
        F_net = -D(V, h) - m*g;
    else
        F_net = D(V, h) - m*g;
    end
    a = F_net / m;
    V_est = V + a * delta_t;
    h_est = h + V * delta_t;
    m_est = max(m0 - 30*(t + delta_t), 400);
    if m_est > 400
        F_net_est = T - D(V_est, h_est) - m_est*g;
    elseif V_est > 0
        F_net_est = -D(V_est, h_est) - m_est*g;
    else
        F_net_est = D(V_est, h_est) - m_est*g;
    end
    a_est = F_net_est / m_est;
    V = V + (a + a_est) / 2 * delta_t;
    h = h + (V + V_est) / 2 * delta_t;
    t = t + delta_t;
    ts = [ts, t];
    hs = [hs, h];
    Vs = [Vs, V];
    As = [As, a];
end
 
%Graficar
figure;
subplot(3,1,1);
plot(ts, hs);
title('Altitud vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Altitud (m)');
subplot(3,1,2);
plot(ts, Vs);
title('Velocidad vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Velocidad (m/s)');
subplot(3,1,3);
plot(ts, As);
title('Aceleración vs Tiempo');
xlabel('Tiempo (s)');
ylabel('Aceleración (m/s^2)');
 
% Resultados
altitud_maxima = max(hs);
velocidad_maxima = max(Vs);
tiempo_total = ts(end);
disp('')
disp('Respuesta')
fprintf('a) La altitud máxima que alcanza el cohete es: %.2f m\n', altitud_maxima);
fprintf('b) La velocidad máxima que alcanza el cohete es: %.2f m/s\n', velocidad_maxima);
fprintf('c) El tiempo transcurrido hasta que el cohete toca el suelo es: %.2f s\n', tiempo_total);
disp('')