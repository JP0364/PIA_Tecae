% clear all 
clc
close all

fprintf(['0. (d2T/dx2)+h''(Ta-T)=0 (Temperatura),\tT(0)=40°C,\tT(10)=200°C,\th=2,\tz0=10 \n' ...
    '1. (d2T/dx2)-0.15T=0,\t\t\t\t\tt(0)=240,\tt(10)=150,\t\th=2,\tz0=-90 \n' ...
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
            h = 2;                              % Tamano de paso
            dx = h;                               % Delta X para diferencias finitas
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
            h = 1;                                % Tamano de paso
            dx = h;                               % Delta X para diferencias finitas
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
            dx = h;                               % Delta X para diferencias finitas
            z0 = -1;                              % Disparo inicial
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

validInput = 0;
while validInput == 0
    sobreescribir = input('Sobreescribir datos del problema?\n\n0 = No\n1 = Si\n\nIngrese "0" o "1" solamente: ');
    if sobreescribir == 1 || sobreescribir == 0
        validInput = 1;
    else
        disp('Por favor, ingrese solo "0" o "1": ');
    end
end

clc

if sobreescribir == 1
    x0 = input('x0 = ');
    xf = input('xf = ');
    y0 = input('y0 = ');
    yf = input('yf = ');
    z0 = input('z0 = ');
    h  = input('h  = ');
end

% Vector x, tamano de vector x
x = x0:h:xf;
n = length(x);

% Declaracion de vectores y, z
Yf = zeros(1,n);
Zg = zeros(1,n);

Yf0 = 0;
while abs(yf-Yf(end)) > 0.00000001

    % Reinicio de Yf y Zg
    Yf = zeros(1,n);
    Zg = zeros(1,n);

    % Reinicio de y, z inicial
    Yf(1) = y0;
    Zg(1) = z0;
    
    for i = 1:n-1
        % Metodo Runge Kutta 4to orden
        kf1 = f(x(i),Yf(i),Zg(i));
        kg1 = g(x(i),Yf(i),Zg(i));
        kf2 = f(x(i)+0.5*h,Yf(i)+0.5*kf1*h,Zg(i)+0.5*kg1*h);
        kg2 = g(x(i)+0.5*h,Yf(i)+0.5*kf1*h,Zg(i)+0.5*kg1*h);
        kf3 = f(x(i)+0.5*h,Yf(i)+0.5*kf2*h,Zg(i)+0.5*kg2*h);
        kg3 = g(x(i)+0.5*h,Yf(i)+0.5*kf2*h,Zg(i)+0.5*kg2*h);
        kf4 = f(x(i)+h,Yf(i)+kf3*h,Zg(i)+kg3*h);
        kg4 = g(x(i)+h,Yf(i)+kf3*h,Zg(i)+kg3*h);
        Yf(i+1) = Yf(i) + (1/6)*(kf1+2*kf2+2*kf3+kf4)*h;
        Zg(i+1) = Zg(i) + (1/6)*(kg1+2*kg2+2*kg3+kg4)*h;
    end
    
    disparo = (yf - Yf(end)) * fac;  % Ajuste de disparo inicial para convergencia
    z0 = z0 + disparo;

end

switch Ec
    case 0
        N = n-2;
        A = zeros(N, N);
        b = dx^2 * 0.01 * 20 * ones(N, 1);
        
        A(eye(size(A)) == 1) = 2 + 0.01*dx^2;
        A = A + diag(-1 * ones(N - 1, 1), 1) + diag(-1 * ones(N - 1, 1), -1);
        b(1) = b(1) + y0;
        b(end) = b(end) + yf;
        
        ydf = [y0; A\b; yf];

        yAnalitco = 73.4523 .* exp(0.1 .* x) - 53.4523 .* exp(-0.1 .* x) + 20;
    case 1
        N = n-2;
        A = zeros(N, N);
        b = 0 * ones(N, 1);
        
        A(eye(size(A)) == 1) = 2 + 0.15*dx^2;
        A = A + diag(-1 * ones(N - 1, 1), 1) + diag(-1 * ones(N - 1, 1), -1);
        b(1) = b(1) + y0;
        b(end) = b(end) + yf;
        
        ydf = [y0; A\b; yf];

        yAnalitco = 3.0169 .* exp(0.3873 .* x) + 236.9831 .* exp(-0.3873 .* x);
    case 2
        N = n-2;
        A = zeros(N, N);
        b = (x(2:end-1)*-dx^2)';
        
        A(eye(size(A)) == 1) = -(14+dx^2);
        A = A + diag((7-dx) * ones(N - 1, 1), 1) + diag((7+dx) * ones(N - 1, 1), -1);
        b(1) = b(1) - (7+dx)*y0;
        b(end) = b(end) - (7-dx)*yf;
        
        ydf = [y0; A\b; yf];

        C1 = (10*exp(40*sqrt(2)/7) + 7*exp(20/7)*exp(80*sqrt(2)/7))/(-exp(20/7) + exp(20/7)*exp(80*sqrt(2)/7));
        C2 = (-10*exp(40*sqrt(2)/7) - 7*exp(20/7))/(-exp(20/7) + exp(20/7)*exp(80*sqrt(2)/7));
        yAnalitco = C1*exp(x.*(1 - 2*sqrt(2))/7) + C2*exp(x.*(1 + 2*sqrt(2))/7) + x - 2;
end


plot(x,Yf,'r-o')
hold on
plot(x,ydf, 'b-x');
plot(x,yAnalitco,'-.')

legend('Disparo','Diferencias Finitas','Analitico')
title(func2str(g),'Comparacion metodos Diferencias finitas, Metodo de disparo y Metodo Analitico')


fprintf('Vector x:\n');
fprintf(' %.2f\t', x);
fprintf('\n');

fprintf('\nMetodo de Disparo:\n');
fprintf(' %.4f\t', Yf);
fprintf('\nDisparo inicial: %.4f\t',Zg(1));
fprintf('\n');

fprintf('\nMetodo de diferencias finitas:\n');
fprintf(' %.4f\t',ydf);
fprintf('\n');

fprintf('\nMetodo Analitico:\n');
fprintf(' %.4f\t',yAnalitco);
fprintf('\n');