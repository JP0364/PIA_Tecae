%% PROBLEMA 1 %%
clear all 
clc
close all

ya = 30+273.15;
rho = 2000;
cp = 710;
v = pi*0.15^2*.05;
A = 2*pi*0.15*0.05+2*pi*.15*.15;
hc = 100;
s = 5.67e-8;
e = 0.9;

f = @(x,y) (-A/(rho*cp*v))*(hc*(y-ya)+s*e*(y^4-ya^4));  % Funcion
x0 = 0;                                % x inicial
xf = 1000;                                % x final
y0 = 1500+273.15;                                % y0
h = 1;                              % Tamano de paso

% Vector x, tamano de vector x
x = x0:h:xf;
n = length(x);

yRK4(1)= y0;

done =0;
% Ciclo for
for i = 1:n-1
    % Metodo Runge Kutta 4to orden
    k1 = f(x(i),yRK4(i));
    k2 = f(x(i)+0.5*h,yRK4(i)+0.5*k1*h);
    k3 = f(x(i)+0.5*h,yRK4(i)+0.5*k2*h);
    k4 = f(x(i)+h,yRK4(i)+k3*h);
    yRK4(i+1) = yRK4(i) + (1/6)*(k1+2*k2+2*k3+k4)*h;
    
    if yRK4(i)<=100+273.15 && done ~= 1
        time = x(i);
        done = 1;
    end
        
end

fprintf('Ecuacion seleccionada: \n%s\n\n', func2str(f));
% fprintf(f);

fprintf('Vector x:\n');
fprintf(' %.2f\t', x);
fprintf('\n');

fprintf('\nSolucion Runge-Kutta 4to Orden: \n');
fprintf(' %.4f\t', yRK4);
fprintf('\n\n\n');
plot(x, yRK4,'- k');
title('Problema 1')

legend('Runge Kutta 4');

fprintf('Tiempo para enfriar: %.0f segundos\n', time)

%% PROBLEMA 2 %%

clear; 
clc; 
close all;

% Parameters setup
m0 = 2000; % Initial mass
Ft = 49050; % Thrust force
rho0 = 1.225; % Density at sea level
Cd = 0.4; % Drag coefficient
A = 30.5; % Cross-sectional area
g = 9.81; % Gravity
h0 = 1000; % Initial height
v0 = 61.29; % Initial velocity
dt = 0.01; % Time step

% Environment and motion equations
rho = @(h) rho0 * exp(-h / 7640);
D = @(v, h) 0.5 * rho(h) * A * v^2 * Cd;

% Initialize state variables
t = 0;
h = h0;
v = v0;
m = m0;
tArr = t;
hArr = h;
vArr = v;
aArr = 0;

% Main simulation loop
while h > 0
    m = max(m0 - 30*t, 400);
    Fnet = Ft - D(v, h) - m*g;
    if m <= 400
        if v <= 0
            Fnet = D(v, h) - m*g;
        else
            Fnet = -D(v, h) - m*g;
        end
    end
    
    a = Fnet / m;
    vEst = v + a * dt;
    hEst = h + v * dt;
    mEst = max(m0 - 30*(t + dt), 400);
    FnetEst = Ft - D(vEst, hEst) - mEst*g;
    if mEst <= 400
        if vEst <= 0
            FnetEst = D(vEst, hEst) - mEst*g;
        else
            FnetEst = -D(vEst, hEst) - mEst*g;
        end
    end
    
    aEst = FnetEst / mEst;
    v = v + (a + aEst) / 2 * dt;
    h = h + (v + vEst) / 2 * dt;
    t = t + dt;
    tArr = [tArr, t];
    hArr = [hArr, h];
    vArr = [vArr, v];
    aArr = [aArr, a];
end

% Results plotting
subplot(3,1,1); plot(tArr, hArr); title('Height vs. Time'); xlabel('Time (s)'); ylabel('Height (m)');
subplot(3,1,2); plot(tArr, vArr); title('Velocity vs. Time'); xlabel('Time (s)'); ylabel('Velocity (m/s)');
subplot(3,1,3); plot(tArr, aArr); title('Acceleration vs. Time'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2)');

% Display final results
[maxH, maxV] = deal(max(hArr), max(vArr));
disp('Response')
fprintf('a) Max height: %.2f m\n', maxH);
fprintf('b) Max velocity: %.2f m/s\n', maxV);
fprintf('c) Time till touchdown: %.2f s\n', tArr(end));




%% Problema 3 %%

clear all 
clc
close all

x0 = 0;                               % x inicial
xf = 20;                              % x final
y0 = 10;                               % y0
yf = 15;                               % yf
h = 0.01;                                % Tamano de paso
dx = h;                               % Delta X para diferencias finitas
z0 = 5;                              % Disparo inicial
fac = 0.01;                        % Factor para ajuste de disparo
f = @(x,y,z) z;                       % Primera derivada
g = @(x,y,z) 0.041*sqrt(1+z^2);             % Segunda derivada

% Vector x, tamano de vector x
x = x0:h:xf;
n = length(x);

% Declaracion de vectores y, z
Yf = zeros(1,n);
Zg = zeros(1,n);


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


plot(x,Yf,'r')
hold on
legend('Disparo')
title('Problema 2, Metodo de disparo')

fprintf('Vector x:\n');
fprintf(' %.2f\t', x);
fprintf('\n');

fprintf('\nMetodo de Disparo:\n');
fprintf(' %.4f\t', Yf);
fprintf('\n\n\nDisparo inicial: %.4f\t',Zg(1));
fprintf('\n');

%% PROBLEMA 4

clear all 
clc
close all

x0 = 0;                               % x inicial
xf = 2;                              % x final
y0 = 10;                               % y0
yf = 1;                               % yf
h = 0.1;                                % Tamano de paso
dx = h;                               % Delta X para diferencias finitas


% Vector x, tamano de vector x
x = x0:h:xf;
n = length(x);

N = n-2;
A = zeros(N, N);
b = 2 * ones(N, 1);
        
A(eye(size(A)) == 1) = (-2/h^2)-1;
A = A + diag(((1/h^2) + 3/h) * ones(N - 1, 1), 1) + diag(((1/h^2) - 3/h) * ones(N - 1, 1), -1);
b(1) = b(1) - y0*((1/h^2) - 3/h);
b(end) = b(end) - yf*((1/h^2) + 3/h);
       
ydf = [y0; A\b; yf];

plot(x,ydf)

miny=min(ydf);

for i = 1: n
    if(ydf(i) == miny)
        minx = x(i);
    end
end

fprintf('El punto mas bajo esta en: \n(x,y) = (%.2f,%.4f)\n\n',minx,miny)