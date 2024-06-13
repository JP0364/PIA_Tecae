% clear all 
clc
close all

fprintf(['1. -2*x^3 + 12*x^2 - 20*x + 8.5,\t0>x>4,\ty(0)=1,\th=0.25 \n' ...
    '2. 4*exp(0.8*x) - 0.5*y,\t\t\t0>x>4,\ty(0)=2,\th=1 \n' ...
    '3. y*x^3 - 1.5*y,\t\t\t\t\t0>x>2,\ty(0)=1,\th=0.25 \n' ...
    '4. (1+4*x)*sqrt(y),\t\t\t\t\t0>x>4,\ty(0)=1,\th=1\n' ...
    '5. -2*y + x^2,\t\t\t\t\t\t0>x>10,\ty(0)=1,\th=1\n\n'])

validInput = 0;
while validInput==0
    Ec = input('Seleccione ecuacion a resolver, \nEscriba "1","2","3","4", o "5": ');
    
    % Switch - Case para seleccionar ecuacion
    switch Ec
        case 1
            f = @(x,y) -2*x^3 +12*x^2 -20*x +8.5;  % Funcion
            x0 = 0;                                % x inicial
            xf = 4;                                % x final
            y0 = 1;                                % y0
            h = 0.25;                              % Tamano de paso
            validInput = true;
        case 2
            f = @(x,y) 4*exp(0.8*x)-0.5*y;         % Funcion
            x0 = 0;                                % x inicial
            xf = 4;                                % x final
            y0 = 2;                                % y0
            h = 1;                                 % Tamano de paso
            validInput = true;
        case 3
            f = @(x,y) y*x^3 - 1.5*y;              % Funcion
            x0 = 0;                                % x inicial
            xf = 2;                                % x final
            y0 = 1;                                % y0
            h = 0.25;                              % Tamano de paso
            validInput = true;
        case 4
            f = @(x,y) (1+4*x)*sqrt(y);            % Funcion
            x0 = 0;                                % x inicial
            xf = 4;                                % x final
            y0 = 1;                                % y0
            h = 1;                                 % Tamano de paso
            validInput = true;
        case 5
            f = @(x,y) -2*y +x^2;                  % Funcion
            x0 = 0;                                % x inicial
            xf = 10;                                % x final
            y0 = 1;                                % y0
            h = 1;                                 % Tamano de paso
            validInput = true;
        otherwise
            fprintf('\nEntrada no válida. Inténtelo de nuevo.\n');
    end
end
clear validInput;
clc

validInput = 0;
while validInput == 0
    sobreescribir = input('Sobreescribir datos de x0, xf, y0, y h?\n\n0 = No\n1 = Si\n\nIngrese "0" o "1" solamente: ');
    if sobreescribir == 1 || sobreescribir == 0
        validInput = 1;
    else
        disp('Por favor, ingrese solo "0" o "1": ');
    end
end

if sobreescribir == 1
    x0 = input('x0 = ');
    xf = input('xf = ');
    y0 = input('y0 = ');
    h = input('h = ');
end
clc

% Vector x, tamano de vector x
x = x0:h:xf;
n = length(x);

% Calculo de Y real analitico
[xReal,yReal] = ode45(f,[x0 xf],y0);
plot(xReal,yReal,"- . k")
hold on

% Variables para Metodo de Ralston - RK 2do orden
a2 = 2/3;
a1 = 1-a2;
q11 = 0.5/a2;
p1 = 0.5/a2;


% Creacion de vectores vacios para cada metodo
yEu = zeros(1,n);
yHe = zeros(1,n);
yPM = zeros(1,n);
yRa = zeros(1,n);
yRK4= zeros(1,n);

% Declaracion de y inicial de cada metodo
yEu(1) = y0;
yHe(1) = y0;
yPM(1) = y0;
yRa(1) = y0;
yRK4(1)= y0;

% Ciclo for
for i = 1:n-1
    % Metodo de Euler%
    yEu(i+1) = yEu(i) + f(x(i),yEu(i))*h;

    % Metodo de Heun
    y0He = yHe(i) + f(x(i),yHe(i))*h;
    yHe(i+1) = yHe(i) + (f(x(i),yHe(i))+f(x(i+1),y0He))*h/2;

    % Metodo Punto Medio
    ym = yPM(i) + (f(x(i),yPM(i))*h/2);
    yPM(i+1) = yPM(i) + f(x(i)+0.5*h,ym)*h;
    
    % Metodo Ralston 
    % Runge Kutta 2do orden a2 = 2/3
    k1 = f(x(i),yRa(i));
    k2 = f(x(i)+p1*h,yRa(i)+q11*k1*h);
    yRa(i+1) = yRa(i) + (a1*k1+a2*k2)*h;

    % Metodo Runge Kutta 4to orden
    k1 = f(x(i),yRK4(i));
    k2 = f(x(i)+0.5*h,yRK4(i)+0.5*k1*h);
    k3 = f(x(i)+0.5*h,yRK4(i)+0.5*k2*h);
    k4 = f(x(i)+h,yRK4(i)+k3*h);
    yRK4(i+1) = yRK4(i) + (1/6)*(k1+2*k2+2*k3+k4)*h;
end

fprintf('Ecuacion seleccionada: \n%s\n\n', func2str(f));
% fprintf(f);

fprintf('Vector x:\n');
fprintf(' %.2f\t', x);
fprintf('\n');

fprintf('\nSolucion Euler:\n');
fprintf(' %.4f\t', yEu);
fprintf('\n');
plot(x, yEu);

fprintf('\nSolucion Heun: \n');
fprintf(' %.4f\t', yHe);
fprintf('\n');
plot(x, yHe);

fprintf('\nSolucion Punto Medio: \n');
fprintf(' %.4f\t', yPM);
fprintf('\n');
plot(x, yPM);

fprintf('\nSolucion Ralston: \n');
fprintf(' %.4f\t', yRa);
fprintf('\n');
plot(x, yRa);

fprintf('\nSolucion Runge-Kutta 4to Orden: \n');
fprintf(' %.4f\t', yRK4);
fprintf('\n');
plot(x, yRK4,'- y');

title(func2str(f));

legend("Metodo Analitico","Metodo Euler","Metodo Heun", ...
    "Metodo Punto Medio","Metodo Ralston","Runge-Kutta 4")

clear validInput;
fprintf('\nJesus Antonio Ramirez Alpizar \n')
fprintf('Matricula: 2077851 \n')
hold off