%Tecnicas Computacionales en Aeronautica
%AF 5 EDOs de frontera
%Victor Omar Rivera Valdez - 1908246
%Metodo de disparo

clear
clc
close all

fprintf('AF 5 EDOs de frontera \n')
fprintf('\nAlumno: Victor Omar Rivera Valdez\n')
fprintf('Matricula: 1908246 \n')
fprintf('\n')

%Seleccion de la ED

EDO = input('Ingresar el numero de la EQ:');

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
    
N =(xf - x0) / h;

%%%INILIZACION DE LOS VECTORES

y = zeros(1,N); y(1) = y0;
z = zeros(1,N); z(1) = z0;
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


hold on
plot(x,y)
legend('Metodo de disparo')
xlabel('x')
ylabel('y')
title('Resolucion del metodo de disparo')
grid on


%Imprimir vectores de soluciones en command window
fprintf('Vector x:\n');
fprintf(' %.2f\t', x);
fprintf('\n');

fprintf('\nVector y:\n');
fprintf(' %.4f\t', y);
fprintf('\n');