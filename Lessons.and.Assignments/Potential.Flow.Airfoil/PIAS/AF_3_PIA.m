%-------------------------------------------------------------------------
%   Proyecto integrador de aprendizaje
%   Tecnicas Computacionales en Aeronautica
%-------------------------------------------------------------------------
%  Jesus Antonio Ramirez Alpizar & Jorge Humberto Corona Martinez
%  Clase: TECAE 1
%  Professor: Israel de Santiago Talavera
%-------------------------------------------------------------------------
clear all
close all
clc

%% INPUTS
U = 38;                     % input free stream velocity [m/s]
v =U/U;                     % input free stream velocity [m/s] normalized
alpha = -20;                % angle of attack, deg
alpha = alpha*pi/180;       % angle of attack in radians
sx = 0.028;                 % displacement of circle center in  real axis. // velocity potential
sy = 0    ;                 % displacement of circle center in  imaginary axis.  // stream function
s = sx + i*sy;              % resultant displacement in the z plane 
r = 0.35;                   % radius of the cylinder in complex z plane (x+iy)    
 
%% CONSTANTS
rho = 1.225;                % fluid density in kg/m3
lambda = r-s;               % offset distance in the complex plane (x+iy)
beta = (alpha);               
k = -2*r*v*sin(beta);        % vortex strength
Gamma = k/(2*pi);           % circulation 
tol = +5e-2;                % geometric grid tolerance for flow visualization 
[x y]= meshgrid(-2:.01:2);   % mesh or grid generation in the circle or complex z plane 
z = x + i*y;               % complex z plane

%% flow velocity in the complex z plane
w = v * exp(1i*alpha);       % Calculate the complex flow velocity in the z plane by multiplying the free stream velocity (v) with the exponential of the angle of attack (alpha) in radians

% grid tolerance check for flow visualization 
for p = 1:length(x)
    for q = 1:length(y)
        if abs(z(p,q)-s) <=  r - tol   % Check if the distance between z(p,q) and s is less than or equal to the difference between the radius (r) and the tolerance (tol)
            z(p,q) = NaN;             % If the condition is true, set z(p,q) to NaN (Not a Number)
        end
    end
end

% Calculate the total complex aerodynamic potential function (f) and grid (J) in the airfoil plane
for p = 1:length(x)
    for q = 1:length(y)
        % Calculate the complex aerodynamic potential function (f) using the following formula:
        % f(p,q) = w*(z(p,q)) + (v*exp(-1i*alpha)*r^2)./(z(p,q)-s) + 1i*k*log(z(p,q))
        f(p,q) = w*(z(p,q)) + (v*exp(-1i*alpha)*r^2)./(z(p,q)-s) + 1i*k*log(z(p,q)); 
        
        % Calculate the grid (J) in the airfoil plane using the following formula:
        % J(p,q) = z(p,q)+lambda^2./z(p,q)
        J(p,q) = z(p,q)+lambda^2./z(p,q);  
    end 
end 
% Calculate the number of nodes in the grid
numNodes = numel(x);

% Calculate the grid characteristics
gridSize = size(x);
gridSpacing = abs(x(1,2) - x(1,1));

% Display the number of nodes and grid characteristics
disp(['Number of nodes: ' num2str(numNodes)]);
disp(['Grid size: ' num2str(gridSize)]);
disp(['Grid spacing: ' num2str(gridSpacing)]);

% Plot the grid in the airfoil plane
figure(1)
hold on
plot(real(J), imag(J), 'k.')
axis equal
axis(1.5*[-1 1 -1 1])
title('Grid in the airfoil plane');

%% Joukowski Mapping Function
% Define the range of angles phi from 0 to 2*pi with a step size of 0.05
phi = 0:.05:2*pi; 

% Iterate over each angle phi
for p = 1:length(phi)
    % Calculate the coordinates of the points on the circle in the complex z plane
    zcirc(p) = r*(cos(phi(p))+1i*sin(phi(p))) + s;
    
    % Apply the Joukowski mapping function to the points on the circle to obtain the corresponding points on the airfoil
    zair(p) = -zcirc(p)+lambda^2./(-zcirc(p));
end 

%% Plotting the streamlines around the cylinder and on the mapped airfoil

% Plot the streamlines around the cylinder
figure(2)
hold on
v2 = -50:0.1:150;
contourf(real(z),imag(z),imag(f),v2);  
fill(real(zcirc),imag(zcirc),'k')
axis equal
axis(1.5*[-1 1 -1 1])
title('Stream lines around the cylinder.');

%% Plot the streamlines on the mapped airfoil
figure(3)
hold on
contourf(real(J),imag(J),imag(f),v2); 
fill(real(zair),imag(zair),'k')
axis equal
axis(1.5*[-1 1 -1 1])
title('Stream line contour on mapped airfoil. ');

