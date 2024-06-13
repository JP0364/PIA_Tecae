% clear all; clc; close all;

% Declaración de variables simbólicas
syms t03 t02 t13 t22 t23 t13 t33 t21 t12 t23 t32 t53 t52 t43 t00 t01 t10 t11 t20 t31

% Constantes y variables del modelo
k = 0.75; % Coeficiente de transferencia de calor
y = 30; % Dimensión y para algunos nodos
y2 = 15; % Dimensión y para otros nodos
x = 40; % Dimensión x para algunos nodos
x2 = 20; % Dimensión x para otros nodos
z = 0.5; % Dimensión z para algunas condiciones
z2 = 1.5; % Dimensión z para otras condiciones
hc = 0.015; % Coeficiente de convección de calor
Ta = 10; % Temperatura ambiente
qz = 10; % Fuente de calor adicional
ka = 0.7; % Coeficiente de conductividad térmica a
kb = 0.5; % Coeficiente de conductividad térmica b

% Ecuaciones para el nodo (0,3)
% Flujo de calor entrante por la parte inferior
qlower = -k * ((t03 - t02) / y) * (x / 2) * z;
% Flujo de calor saliente por la derecha
qright = -k * ((t13 - t03) / x) * (y / 2) * z;
% Pérdida de calor por convección en la parte superior
qupper = -hc * (Ta - t03) * (x / 2) * z;
% Balance de flujo de calor en el nodo (0,3)
eq = qlower - qright - qupper;
disp('La ecuación para el nodo 0,3 de la figura 1 es:')
disp(eq)

% Ecuaciones para el nodo (2,3)
qlowerdt = -k * ((t23 - t22) / y) * ((x/2)+(x2/2)) * z;
qleftdt = -k * ((t23 - t13) / x) * (y / 2) * z;
qrightdt = -k * ((t33 - t23) / x2) * (y / 2) * z;
qupperdt = -hc * (Ta - t23) * ((x/2)+(x2/2)) * z;
% Balance de flujo de calor en el nodo (2,3)
eqdt = qlowerdt + qleftdt - qrightdt - qupperdt;
disp('La ecuación para el nodo 2,3 de la figura 1 es:')
disp(eqdt)

% Ecuaciones para el nodo (2,2)
qlowerdd = -k * ((t22 - t21) / y2) * ((x/2)+(x2/2)) * z;
qleftdd = -k * ((t22 - t12) / x) * ((y/2)+(y2/2)) * z;
qsource = 10*pi*(y2/2)*(y/2); % Fuente de calor interno
qrightdd = -k * ((t32 - t22) / x) * ((y/2)+(y2/2)) * z;
qupperdd = -k * ((t23 - t22) / y) * ((x/2)+(x2/2)) * z;
% Balance de flujo de calor en el nodo (2,2)
eqdd = qlowerdd + qleftdd + qsource - qrightdd - qupperdd;
disp('La ecuación para el nodo 2,2 de la figura 1 es:')
disp(eqdd)

% Ecuaciones para el nodo (5,3)
qlowerct = -k * ((t53 - t52) / y) * (x/2) * z;
qleftct = -k * ((t53 - t43) / x2) * (y/2) * z;
qupperct = -hc * (Ta - t53) * (x2/2) * z;
% Balance de flujo de calor en el nodo (5,3)
eqct = qlowerct + qleftct - qupperct;
disp('La ecuación para el nodo 5,3 de la figura 1 es:')
disp(eqct)

% Ecuación para el nodo (0,0) de la figura 2
qleftcc = -hc * (Ta - t00) * (y / 2) * z2;
qrightcc = -k * ((t01 - t00) / y2) * (x / 2) * z2;
quppercc = -k * ((t10 - t00) / x) * (y2 / 2) * z2;
% Balance de flujo de calor en el nodo (0,0)
eqcc = qleftcc - qrightcc - quppercc;
disp('La ecuación para el nodo 0,0 de la figura 2 es:')
disp(eqcc)

% Ecuación para el nodo (1,1) de la figura 2
qleftooa = -ka * ((t11 - t01) / x) * (y * z2);
qlowerooa = -ka * ((t11 - t10) / y2) * (x / 2) * z2;
qupperooa = -ka * ((t12 - t11) / y) * (x / 2) * z2;
qloweroob = -kb * ((t11 - t10) / y2) * (x2 / 2) * z2;
qupperoob = -kb * ((t12 - t11) / y) * (x / 2) * z2;
qrightoo = -kb * ((t21 - t11) / x) * (y * z2);
% Balance de flujo de calor en el nodo (1,1)
eqoo = qleftooa + qlowerooa + qloweroob - qupperooa - qupperoob - qrightoo;
disp('La ecuación para el nodo 1,1 de la figura 2 es:')
disp(eqoo)

% Ecuación para el nodo (2,1) de la figura 2
qlowerdu = -kb * ((t21 - t20) / y2) * (x/2) * z2;
qleftdu = -kb * ((t21 - t11) / x2) * ((y + y2) / 2) * z2;
qsourcedu = qz * (x2) * ((y + y2) / 2); % Fuente de calor adicional
qrightdu = -kb * ((t32 - t21) / y) * (x/2) * z2;
qupperdu = -kb * ((t31 - t21) / (x2)) * ((y + y2) / 2) * z;
% Balance de flujo de calor en el nodo (2,1)
eqdu = qlowerdu + qleftdu + qsourcedu - qrightdu - qupperdu;
disp('La ecuación para el nodo 2,1 de la figura 2 es:')
disp(eqdu)
