clc;
close all;
clear all;

% Definir las variables simbólicas para las temperaturas en los nodos
syms temp03 temp02 temp13 temp22 temp23 temp33 temp21 temp12 temp32 temp53 temp52 temp43 temp00 temp01 temp10 temp11 temp20 temp31

% Constantes y parámetros del problema
conductividad = 0.75;
alturaY = 30;
alturaY2 = 15;
anchoX = 40;
anchoX2 = 20;  
profundidadZ = 0.5;
profundidadZ2 = 1.5;
coefConv = 0.015; % Coeficiente de convección
tempAmbiente = 10; % Temperatura ambiente
qFuente = 10; % Flujo de calor fuente

% Ecuaciones para el nodo (0,3)
flujoInferior = -conductividad * ((temp03 - temp02) / alturaY) *  (anchoX / 2) * profundidadZ;
flujoDerecho = -conductividad * ((temp13 - temp03) / anchoX) * (alturaY / 2) * profundidadZ;
flujoSuperior = -coefConv * (tempAmbiente - temp03) * (anchoX / 2) * profundidadZ;
ecuacionNodo03 = flujoInferior - flujoDerecho - flujoSuperior;
disp('La ecuación para el nodo (0,3) de la figura 1 es:')
disp(ecuacionNodo03)

% Ecuaciones para el nodo (2,3)
flujoInferior23 = -conductividad * ((temp23 - temp22) / alturaY) *  ((anchoX/2)+(anchoX2/2)) * profundidadZ;
flujoIzquierdo23 = -conductividad * ((temp23 - temp13) / anchoX) *  (alturaY / 2) * profundidadZ;
flujoDerecho23 = -conductividad * ((temp33 - temp23) / anchoX2) *  (alturaY / 2) * profundidadZ;
flujoSuperior23 = -coefConv * (tempAmbiente - temp23) * ((anchoX/2)+(anchoX2/2)) * profundidadZ;
ecuacionNodo23 = flujoInferior23 + flujoIzquierdo23 - flujoDerecho23 - flujoSuperior23;
disp('La ecuación para el nodo (2,3) de la figura 1 es:')
disp(ecuacionNodo23)

% Ecuaciones para el nodo (2,2) con fuente de calor
flujoInferior22 = -conductividad * ((temp22 - temp21) / alturaY2) *  ((anchoX/2)+(anchoX2/2)) * profundidadZ;
flujoIzquierdo22 = -conductividad * ((temp22 - temp12) / anchoX) *  ((alturaY/2)+(alturaY2/2)) * profundidadZ;
fuenteCalor = qFuente * pi * (alturaY2/2) * (alturaY/2);
flujoDerecho22 = -conductividad * ((temp32 - temp22) / anchoX) * ((alturaY/2)+(alturaY2/2)) * profundidadZ;
flujoSuperior22 = -conductividad * ((temp23 - temp22) / alturaY) * ((anchoX/2)+(anchoX2/2)) * profundidadZ;
ecuacionNodo22 = flujoInferior22 + flujoIzquierdo22 + fuenteCalor - flujoDerecho22 - flujoSuperior22;
disp('La ecuación para el nodo (2,2) de la figura 1 es:')
disp(ecuacionNodo22)

% Ecuaciones para el nodo (5,3)
flujoInferior53 = -conductividad * ((temp53 - temp52) / alturaY) *  (anchoX/2) * profundidadZ;
flujoIzquierdo53 = -conductividad * ((temp53 - temp43) / anchoX2) *  (alturaY/2) * profundidadZ;
flujoSuperior53 = -coefConv * (tempAmbiente - temp53) * (anchoX2/2) * profundidadZ;
ecuacionNodo53 = flujoInferior53 + flujoIzquierdo53 - flujoSuperior53;
disp('La ecuación para el nodo (5,3) de la figura 1 es:')
disp(ecuacionNodo53)

% Ecuación para el nodo (0,0) de la figura 2
flujoIzquierdo00 = -coefConv * (tempAmbiente - temp00) * (alturaY / 2) * profundidadZ2;
flujoDerecho00 = -conductividad * ((temp01 - temp00) / alturaY2) * (anchoX / 2) * profundidadZ2;
flujoSuperior00 = -conductividad * ((temp10 - temp00) / anchoX) * (alturaY2 / 2) * profundidadZ2;
ecuacionNodo00 = flujoIzquierdo00 - flujoDerecho00 - flujoSuperior00;
disp('La ecuación para el nodo (0,0) de la figura 2 es:')
disp(ecuacionNodo00)

% Ecuación para el nodo (1,1) de la figura 2 con dos materiales distintos
flujoIzquierdo11 = -conductividad * ((temp11 - temp01) / anchoX) * (alturaY) * profundidadZ2;
flujoInferior11 = -conductividad * ((temp11 - temp10) / alturaY2) * (anchoX / 2) * profundidadZ2;
flujoSuperior11A = -conductividad * ((temp12 - temp11) / alturaY) * (anchoX / 2) * profundidadZ2;
flujoInferior11B = -coefConv * ((temp11 - temp10) / alturaY2) * (anchoX2 / 2) * profundidadZ2;
flujoSuperior11B = -coefConv * ((temp12 - temp11) / alturaY) * (anchoX / 2) * profundidadZ2;
flujoDerecho11 = -coefConv * ((temp21 - temp11) / anchoX) * (alturaY) * profundidadZ2;
ecuacionNodo11 = flujoIzquierdo11 + flujoInferior11 + flujoInferior11B - flujoSuperior11A - flujoSuperior11B - flujoDerecho11;
disp('La ecuación para el nodo (1,1) de la figura 2 es:')
disp(ecuacionNodo11)

% Ecuación para el nodo (2,1) de la figura 2 con fuente de calor
flujoInferior21 = -coefConv * ((temp21 - temp20) / alturaY2) * (anchoX/2) * profundidadZ2;
flujoIzquierdo21 = -coefConv * ((temp21 - temp11) / anchoX2) * ((alturaY/2)+(alturaY2/2)) * profundidadZ2;
fuenteCalor21 = qFuente * anchoX2 * ((alturaY/2)+(alturaY2/2));
flujoDerecho21 = -coefConv * ((temp32 - temp21) / alturaY) * (anchoX/2) * profundidadZ2;
flujoSuperior21 = -coefConv * ((temp31 - temp21) / anchoX2) * ((alturaY/2)+(alturaY2/2)) * profundidadZ;
ecuacionNodo21 = flujoInferior21 + flujoIzquierdo21 + fuenteCalor21 - flujoDerecho21 - flujoSuperior21;
disp('La ecuación para el nodo (2,1) de la figura 2 es:')
disp(ecuacionNodo21)
