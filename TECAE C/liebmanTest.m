%Metodo de Liebman
clc, clear all
%Dimensiones del problema
L=40;
W=40;
K=0.49;
Es=1;
%Nodos
dx=1; nx=(L/dx)+1;
dy=1; ny=(W/dy)+1;
%Calculo del facor de sobrerelajación
n=4;
m=4;
I=4/(2+sqrt(4-(cos(pi/m)+cos(pi/n))^2));

% Malla
for j=1:ny
for i=1:nx
x(i,j)=(i-1)*dx;
y(i,j)=(j-1)*dy;
end
end
%Matriz T, que representa la funcion de la temperatura
T(1:nx,1:ny,1)=0; %CDondición Inicial, para el metodo de Liebman
%Iteraciones
kmax=1000;
for k=1:kmax
%Condiciones de frontera

%Arriba y abajo
for i=1:nx
T(i,1,k+1)=0; %Abajo
T(i,ny,k+1)=120; %Arriba
end
% Derecha y Izquierda
for j=1:ny
T(1,j,k+1)=60; %Izquierda
T(nx,j,k+1)=50; %Derecha
end
%Algortimo de Libman
for j=2:ny-1
for i=2:nx-1
T(i,j,k+1)=(T(i+1,j,k)+T(i-1,j,k)+T(i,j+1,k)+T(i,j-1,k))/4;
T(i,j,k+2)=I*T(i,j,k+1)+(1-I)*T(i,j,k);
%Algoritmo del error permisible
E(i,j,k)=(abs(T(i,j,k+2)-T(i,j,k+1))/T(i,j,k+2))*100;
if (E<=Es)
fprintf('La solucion es : %12.8f\n',T(i,j,k+2))

break
end

end
end
end
disp('El valor de la temperaturas')
TT=T(:,:,kmax)'
%vectores que representa el flujo de calor
qx(1:nx,1:ny,1)=0;
qy(1:nx,1:ny,1)=0;

for j=2:ny-1
for i=2:nx-1
qx(i,j)=-K*(T(i+1,j,k)-T(i-1,j,k))/(2*dx);
qy(i,j)=-K*(T(i,j+1,k)-T(i,j-1,k))/(2*dy);
Q(i,j)=sqrt(qx(i,j).^2+qy(i,j).^2);

end
end
disp('El valor de los flujos de calor ')
Q11=Q(4,2);
Q21=Q(4,3);
Q31=Q(4,4);
Q12=Q(3,2);
Q22=Q(3,3);
Q32=Q(3,4);
Q13=Q(2,2);
Q23=Q(2,3);
Q33=Q(2,4);

qq=[ Q11 Q21 Q31; Q12 Q22 Q32 ; Q13 Q23 Q33]


% Plot de temperaturas
figure;
imagesc(x(1,:), y(:,1), TT);
colorbar;
title('Distribución de Temperatura');
xlabel('X [cm]');
ylabel('Y [cm]');

% Plot de magnitudes de flujo de calor
figure;
imagesc(x(1,:), y(:,1), Q);
colorbar;
title('Magnitud del Flujo de Calor');
xlabel('X [cm]');
ylabel('Y [cm]');
