syms t03 t02 t13 t22 t23 t13 t33 t21 t12 t23 t32 t53 t52 t43 t00 t01 t10 t11 t20 t31
% Constantes y variables dadas
k = 0.75;
y = 30;
y2 = 15;
x = 40;
x2 = 20;  
z = 0.5;
z2 = 1.5;
hc = 0.015;
Ta = 10;
qz = 10;
ka = 0.7;
kb = 0.5;
% Ecuaciones para el nodo 0,3
qlower = -k * ((t03 - t02) / y) *  (x / 2) * z;
qright = -k * ((t13 - t03) / x) * (y / 2) * z;
qupper = -hc * (Ta - t03) * (x / 2) * z;
eq = qlower  - qright - qupper;
disp('La ecuación para el nodo 0,3 de la figura 1 es:')
disp(eq)
% Ecuaciones para el nodo 2,3
qlowerdt = -k * ((t23 - t22) / y) *  ((x/2)+(x2/2)) * z;
qleftdt = -k * ((t23 - t13) / x) *  (y / 2) * z;
qrightdt = -k * ((t33 - t23) / x2) *  (y / 2) * z;
qupperdt = -hc * (Ta - t23) * ((x/2)+(x2/2)) * z;
eqdt = qlowerdt + qleftdt - qrightdt - qupperdt;
disp('La ecuación para el nodo 2,3 de la figura 1 es:')
disp(eqdt)
%Ecuaciones para el nodo 2,2
qlowerdd = -k * ((t22 - t21) / y2) *  ((x/2)+(x2/2)) * z;
qleftdd = -k * ((t22 - t12) / x) *  ((y/2)+(y2/2)) * z;
qsource = 10*pi*(y2/2)*(y/2);
qrightdd = -k * ((t32 - t22) / x) * ((y/2)+(y2/2)) * z;
qupperdd = -k * ((t23 - t22)/(y)) * ((x/2)+(x2/2)) * z;
eqdd = qlowerdd + qleftdd + qsource - qrightdd - qupperdd;
disp('La ecuación para el nodo 2,3 de la figura 1 es:')
disp(eqdd)
%Ecuaciones para el nodo 5,3
qlowerct = -k * ((t53 - t52) / y) *  (x/2) * z;
qleftct = -k * ((t53 - t43) / x2) *  (y/2) * z;
qupperct = -hc * (Ta - t53) * (x2/2) * z;
eqct = qlowerct + qleftct - qupperct;
disp('La ecuación para el nodo 5,3 de la figura 1 es:')
disp(eqct)
%Ecuación para el nodo 0,0 de la figura 2
qleftcc = -hc * (Ta - t00) * (y / 2) * z2;
qrightcc = -k * ((t01 - t00) / y2) * (x / 2) * z2;
quppercc = -k * ((t10 - t00) / x) * (y2 / 2) * z2;
eqcc = qleftcc  - qrightcc - quppercc;
disp('La ecuación para el nodo 0,0 de la figura 2 es:')
disp(eqcc)
%Ecuación para el nodo 1,1 de la figura 2
%q1
qleftooa = -ka * ((t11 - t01) / x) * ((y/2)+ (y/2)) * z2;
%q2
qlowerooa = -ka * ((t11 - t10) / y2) * (x / 2) * z2;
%q3
qupperooa = -ka * ((t12 - t11) / y) * (x / 2) * z2;
%q5
qloweroob = -kb * ((t11 - t10) / y2) * (x2 / 2) * z2;
%q4
qupperoob = -kb * ((t12 - t11) / y) * (x / 2) * z2;
%q6
qrightoo =  -kb * ((t21 - t11) / x) * ((y/2)+ (y/2)) * z2;
%q1 + q2 + q5 - q3 - q4 -q6
eqoo = qleftooa + qlowerooa + qloweroob - qupperooa - qupperoob - qrightoo;
disp('La ecuación para el nodo 1,1 de la figura 2 es:')
disp(eqoo)
%Ecuación para el nodo 2,1 de la figura 2
qlowerdu = -kb * ((t21 - t20) / y2) * (x/2) * z2;
qleftdu = -kb * ((t21 - t11) / x2) *  ((y/2)+(y2/2)) * z2;
qsourcedu = qz*(x2)*((y/2)+(y2/2));
qrightdu = -kb * ((t32 - t21) / y) * (x/2) * z2;
qupperdu = -kb * ((t31 - t21)/(x2)) * ((y/2)+(y2/2)) * z;
eqdu = qlowerdu + qleftdu + qsourcedu - qrightdu- qupperdu;
disp('La ecuación para el nodo 2,1 de la figura 2 es:')
disp(eqdu)