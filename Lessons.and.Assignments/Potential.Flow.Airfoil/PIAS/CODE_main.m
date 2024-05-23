%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This program is based on solving the combined Euler equations using 
% the approach of small perturbation theory, using central difference 
% finite discretization and the Newton Raphson algorithm.
% by Dr. Abdelhamid BOUHELAL @10/11/2017, Montreal, Canada. 
%  https://www.abdelhamid-bouhelal.net/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Programme principal
clear all;    % Effacer les variables
clc;          % Effacer l'ecran
format long   % Affichage en double précision 
%% Données du code
prompt={'Maximum iterations', 'Calculation accuracy','Domain length (m)', ...
    'Domain Width (m)','X Step', 'Y Step','Start Airfoil position (m)',...
    'Airfoil chorde length (m)','Initial estimatation','Mach number','Airfoil thickness'};
title='Airfoils Calculator';
lines=1;
def={'100','1e-06','4.0','2.5','0.05','0.05','1.5','1.0','0.5','0.1','0.006'};
answer=inputdlg(prompt,title,lines,def);
assignin('base','maxIter',str2double(answer{1})); % max des iterations
assignin('base','tolX',str2double(answer{2}));% erreur de calcul
assignin('base','Lx',str2double(answer{3}));% longeur du domaine 
assignin('base','Ly',str2double(answer{4})); % largeur du domaine
assignin('base','hx',str2double(answer{5})); % pas suivant x
assignin('base','hy',str2double(answer{6})); % pas suivant y
assignin('base','Dp',str2double(answer{7})); % position de début de profil
assignin('base','C',str2double(answer{8})); % la corde du profil
assignin('base','est_x',str2double(answer{9})); % Estimation initiale
assignin('base','M',str2double(answer{10})); % Mach number
assignin('base','t',str2double(answer{11})); % Airfoil thickness
%%
Nx=ceil(Lx/hx);  % nombre des éléments suivant ox
Ny=ceil(Ly/hy);  % nombre des éléments suivant oy
N=Nx*Ny; % nombre des équations à résoudre
Fp=Dp+C; % calcul la position de la fin du profil
Dp=ceil(Dp/hx); % position de début du maillage
Fp=ceil(Fp/hx);  % position de la fin du maillage
%% Pour tracer graphiquement les résultats
debprof=Dp:Fp;
debx=2:Nx-1;
deby=2:Ny-1;
%% Génération du maillage 
x_grid=linspace(0,Lx,Nx+1);
y_grid=linspace(0,Ly,Ny+1);
[X1,Y1]=meshgrid(x_grid,y_grid);
[X2,Y2]=meshgrid(y_grid,x_grid);
%% % Conditions initiales
for i=1:N
X0(i)=est_x;   % Estimation Initiale
end
X0=X0';        % X0 sous forme colonne 
%% Méthode de Newton Raphson
x=X0;
Xoled=X0;
disp('_____________________________Iterations______________________________')
for i=1:maxIter
    F=EQUATIONS(x,Dp,Fp,Nx,Ny,hx,hy,N,M,t);
    jac=JACFUNC(F,x,Dp,Fp,Nx,Ny,hx,hy,N,M,t);
    x=x-(inv(jac))*F;
    err(:,i)=abs(x-Xoled);
    Xoled=x;
    if (err(:,i)< tolX)     
      break;
    end 
    disp(['Iter   ',num2str(i),'   Err= ',num2str(max(err(:,i)))]);
Err(i)=max(err(:,i));
iter(i)=i;
end
disp('_______________________________Slutions______________________________')
%% Affichage les solutions
for i=1:N
disp(['x(',num2str(i),')=  ',num2str(x(i))])
end
%% Transformation vecteur x en Matrice Phi
cont=0;
for j=1:Ny
    for i=1:Nx
phi(i,j)=x(i+Nx*cont);
    end 
    cont=cont+1;
end
%% Calcul - vitesse U
for i=2:Nx-1
for j=1:Ny
U(i,j)=1+((phi(i+1,j)-phi(i-1,j)))/(2*hx);
end
end
%% Calcul - vitesse V 
for i=2:Nx-1
for j=2:Ny-1
V(i,j)=((phi(i,j+1)-phi(i,j-1)))/(2*hy);
end
end
%% Calcul - Coefficient de pression (Cp)
for i=2:Nx-1
    for j=1:Ny
   CP(i,j)=-2*((phi(i+1,j)-phi(i-1,j)))/(2*hx);
    end
end
%% calcul Cn et Ct
Cn=0;
for i=Dp:Fp
    for j=1:2
Cn=((CP(i,j)+CP(i+1,j))/2)*((i+1)*hx-i*hx)+Cn;
end
end
%
Ct=0;
for i=Dp:Fp
    for j=1:2
Ct=((CP(i,j)+CP(i+1,j))/2)*((j+1)*hy-j*hy)+Ct;
    end
end
%% Calcul Cl et Cdp
Alpha=0.0;
Cl=Cn*sin(Alpha)+Ct*cos(Alpha);
Cdp=Cn*sin(Alpha)-Ct*cos(Alpha);
disp('____________________________________________________________________')
%% Affichage graphique
figure
subplot(2,2,1)
box on
grid on
plot(iter,Err,'ro-')
xlabel('Iter')
ylabel('Err')
%title('Convergence Courbe')
%% Afficher les figures 
subplot(2,2,2)
hold on 
grid on 
box on 
plot(phi(:,1))
plot(phi(:,2))
plot(phi(:,3))
plot(phi(:,4))
plot(phi(:,5))
plot(phi(:,6))
plot(phi(:,7))
plot(phi(:,Ny))
legend('y=1','y=2','y=3','y=4','y=5','y=6','y=7','y=Ny')
%title('Fonction de courant Phi')
xlabel('X (m)')
ylabel('Phi')
hold off
%% Tracer la vitesse U 
subplot(2,2,3)
hold on 
grid on 
box on 
plot(U(debx,1))
plot(U(debx,2))
plot(U(debx,3))
plot(U(debx,4))
plot(U(debx,5))
plot(U(debx,6))
plot(U(debx,7))
plot(U(debx,Ny-1))
legend('y=1','y=2','y=3','y=4','y=5','y=6','y=7','y=Ny-1')
%title('Vitesse U/Uinf')
xlabel('X (m)')
ylabel('U/Uinf')
hold off
%% Tracer la vitesse V 
subplot(2,2,4)
hold on 
grid on 
box on 
debn=15:25;
%plot(V(deb,1))
plot(V(:,2))
plot(V(:,3))
plot(V(:,4))
plot(V(:,5))
plot(V(:,6))
plot(V(:,7))
plot(V(:,8))
legend('y=2','y=3','Y=4','y=5','y=6','y=7','Y=8')
%title('Vitesse V/Vinf')
xlabel('X (m)')
ylabel('V/Vinf')
hold off
%% Tracer CP
figure
subplot(2,2,1)
hold on 
grid on 
box on 
%plot(V(deb,1))
plot(-CP(debprof,2))
plot(-CP(debprof,3))
plot(-CP(debprof,4))
plot(-CP(debprof,5))
plot(-CP(debprof,6))
plot(-CP(debprof,7))
plot(-CP(debprof,8))
legend('y=2','y=3','Y=4','y=5','y=6','y=7','Y=8')
%title(' Coefficient de pression')
xlabel('X (m)')
ylabel('-CP')
hold off
%% Afficher les contours 
subplot(2,2,2)
[C,h]=contourf(phi,25,'ShowText','on')
xlabel('Contour Phi')
subplot(2,2,3)
contourf(U(debx,deby),25)
xlabel('Contour U')
subplot(2,2,4)
contourf(V(debx,deby),25)
xlabel('Contour V')
figure
subplot(2,1,1)
contourf(CP,25)
xlabel('Contour CP')
subplot(2,1,2)
hold on
plot(X1,Y1,'k-',Y2,X2,'k-')
axis([0 Lx 0 Ly])
%title('Mesh Grid')
box on
hold off
%_____________________________________ end _________________________________