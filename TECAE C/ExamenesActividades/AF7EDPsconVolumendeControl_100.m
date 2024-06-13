%Fernando Alan Esparza Treviño 1948853
clear
clc
close all
syms T03 T02 T13 T21 T22 T33  T12 T23 T32 T53 T52 T43 T20 T31
%Problema 1

k = 0.75;
dy1 = 30;
dy1_2 = 15;
dy2 = 40;
dy2_2 = 20;
z = 0.5;
dx1= 40;
dx1_2 = 20;
dx2 = 30;
h1 = 20;
hc = 0.015;
Ta = 10;
qz = 10;

%Nodo 0,3

eq1 = k*dy1_2*z*(T13-T03)/dx1 ...
    - k*(dy2_2)*z*((T03-T02)/dx2) ...
    + hc*dx1_2*z*(Ta-T03);
disp('Problema 1, Nodo 0,3:')
disp(eq1)

%Nodo 2,3

eq2 = -k * ((T23 - T22) / dy1) *  (dx2) * z ...
    - k * ((T23 - T13) / dy2) *  (dy1 / 2) * z ...
    + k * ((T33 - T23) / dx1_2) *  (dy1_2) * z ...
    + hc * (Ta - T23) * (dx2) * z;
disp('Problema 1, Nodo 2,3:')
disp(eq2)

%Nodo 2,2

eq3 = -k * ((T22 - T12) / dy2) * (dx2-7.5) * z ...
    + k * ((T32 - T22) / dy2_2) * (dx2-7.5) * z ...
    + qz * 3.1416 * (dy1_2/2)^2 ...
    - k * ((T22 - T21) / dy1_2) * (dx2) * z ...
    + k * ((T23 - T22) / dy1) * (dx2) * z;
disp('Problema 1, Nodo 2,2:')
disp(eq3)

%Nodo 5,3

eq4 = -k * ((T53 - T52) / dy1) * (dx1_2/2) * z ...
- k * ((T53 - T43) / dx1_2) * (dy1_2) * z ...
- hc * (Ta - T53) * (dx1_2/2) * z;
disp('Problema 1, Nodo 5,3:')
disp(eq4)

%%
syms T00 T01 T11 T21 T10 T12
%Problema 2

dy1 = 15;
dy1_2 = 7.5;
dy2 = 30;
dy2_2 = 15;
dx1 = 20;
dx1_2 = 10;
dx2 = 40;
dx2_2 = 20;
k1 = 0.7;
k2 = 0.5;
hc = 0.015;
qz = 10;
z = 1.5;

%Nodo 0,0

eq1 = hc * dy1_2 * z * (dx1-T00) ...
    + k1 * dy1_2 * z * ((T10-T00)/dx2) ...
    + k1 * dx2_2 * z * ((T01-T00)/dy2_2);
disp('Problema 2, Nodo 0,0:')
disp(eq1)

%Nodo 1,1

eq2 = - k1 * (dy1+dy1_2) * (z/2) * ((T11-T01)/dx2)...
    + k2 * (dy1+dy1_2) * z * ((T21-T11)/dx1)...
    - k1 * dx2_2 * z * ((T11-T10)/dy1)...
    - k2 * dx1_2 * z * ((T11-T10)/dy2_2)...
    + k1 * dx1 * z * ((T12-T11)/dy2)...
    + k2 * dx1_2 * z * ((T12-T11)/dy2);
disp('Problema 2, Nodo 1,1:')
disp(eq2)

%Nodo 2,1
eq3 = - k2 * (dy1+dy1_2) * z *((T21-T11)/dx1) ...
      + k2 * (dy1+dy1_2)* z *((T31-T21)/dx1) ...
      - k2 * dx2_2 * z * ((T21-T20)/dy2_2) ...
      + k2 * dx2_2 * z * ((T22-T21)/dy2) ...
      + qz * (dy1+dy1_2) * (dx1);

disp('Problema 2, Nodo 2,1:')
disp(eq3)