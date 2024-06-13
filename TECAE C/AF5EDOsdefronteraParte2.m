% clear all
close all
clc

% Parámetros
L = 30;
m = 68.1;
Cd = 0.25;
k = 40;
g = 9.81;
c = 8;
h = 0.01;
tol = 0.5;

% valores iniciales
x = 0;
v = 0;
T = 0:h:100;
n = length(T);

% Aceleración
a = @(x, v) g - (Cd/m) * abs(v) * v;

steatyTi = 0;
top = 10;
bottom = -10;
X = zeros(1,n);
V = zeros(1,n);
X(1) = x;
V(1) = v;

% Runge-Kutta 4
for ti = 2 : n
    a = @(x, v) g - (Cd/m) * abs(v) * v - (x > L) * ((k/m) * (x - L) + (c/m) * v);

    k1x = h * v;
    k1v = h * a(x, v);
    k2x = h * (v + 0.5*k1v);
    k2v = h * a(x + 0.5*k1x, v + 0.5*k1v);
    k3x = h * (v + 0.5*k2v);
    k3v = h * a(x + 0.5*k2x, v + 0.5*k2v);
    k4x = h * (v + k3v);
    k4v = h * a(x + k3x, v + k3v);

    x = x + (k1x + 2*k2x + 2*k3x + k4x) / 6;
    v = v + (k1v + 2*k2v + 2*k3v + k4v) / 6;
    X(ti) = x;
    V(ti) = v;
    if (ti >= 3 && steatyTi == 0)
        if ((X(ti) < X(ti-1)) && X(ti-1) > X(ti-2))
            top = X(ti-1);
            topTime = ti-1;
        end
        if ((X(ti) > X(ti-1)) && X(ti-1) < X(ti-2))
            bottom = X(ti-1);
            bottomTime = ti-1;
        end
    end
    if ((abs(top - bottom) < tol) && steatyTi == 0)
        steatyTi = ti-1;
    end
end

% Plot
subplot(2,1,1);
hold on;
plot(T, -X,'k');
title('Tiempo vs. Posicion');
plot(T(topTime),-X(topTime),'d')
plot(T(bottomTime),-X(bottomTime),'d')
legend('Posicion en funcion del tiempo','Ultima oscilacion antes de SteadyState (bottom)','Ultima oscilacion antes de SteadyState (top)');
grid on;
ylabel('Distancia (m)');
subplot(2,1,2);
plot(T, V, 'b');
grid on;
title('Tiempo vs. Velocidad');
xlabel('Tiempo (s)');
ylabel('Velocidad (m/s)');
legend('Velocidad en funcion del tiempo');

fprintf(['La primera grafica representa la posicion del saltador del bungee respecto al \n' ...
    'tiempo. Esta grafica representa visualmente la caída de la persona bajo \n' ...
    'la influencia de la gravedad, y su interacción con la fuerza elastica \n' ...
    '(cuerda) y demas interacciones definidas en los parametros. Se destacan \n' ...
    'dos puntos que representan la ultima oscilacion antes \n' ...
    'de que el sistema alcance el estado estacionario. \n\n'])

fprintf(['La segunda grafica muestra como cambia la velocidad de la persona a \n' ...
    'lo largo del tiempo, esta velocidad se obtuvo a traves de la integracion \n' ...
    'de la velocidad. \n\n'])

fprintf(['estas graficas juntas muestran como la persona inicia su \n' ...
    'movimiento desde el reposo, experimenta aceleracion debido a la \n' ...
    'gravedad y es afectado por la resistencia del aire, y la forma en que \n' ...
    'eventualmente entra en un estado de oscilacion amortiguada debido \n' ...
    'a la fuerza elastica que ejerce la cuerda y de la amortiguacion aplicada \n' ...
    'cuando la persona se estira mas alla de la longitud que tiene. \n' ...
    'Finalmente, el sistema alcanza un estado estacionario, \n' ...
    'donde la posición y la velocidad se estabilizan.\n\n'])

fprintf(['El valor final de la posición representa el punto donde la persona \n' ...
    'se ha detenido (o la posicion deja de variar significativamente. \n' ...
    'Esto ocurre cuando la combinación de la resistencia del aire, la gravedad \n' ...
    'y las fuerzas elasticas y de amortiguacion equilibran el movimiento de la persona, \n' ...
    'llevandolo a un estado estacionario.\n\n'])

fprintf(['El instante en el tiempo en que las oscilaciones bajan de la amplitud \n' ...
    'de tolerancia definida de %.2f metros es a los %.4f segundos.\n'], tol, T(steatyTi));
