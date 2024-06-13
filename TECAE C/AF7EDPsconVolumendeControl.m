close all; clear; clc;

% Material properties
thermalConductivity = 0.75; % thermal conductivity [cal/(s*cm*ºC)]
convectionCoefficient = 0.015; % convection coefficient [cal/(cm^2*ºC*s)]
thickness = 0.5; % plate thickness [cm]
ambientTemp = 10; % ambient temperature [ºC]

% Mesh dimensions
xDistance = 40; % distance in x [cm]
yDistance = [30, 15]; % distance in y [cm] for different segments

% Definition of highlighted nodes
highlightedNodes = [1 1; 2 1; 3 1; 4 1];

% Assuming a predefined array of temperatures, T, for all nodes
% This array should be defined or imported depending on the context
% T = zeros(5, 4); % Example, adjust according to the mesh dimensions and initial conditions

% Iterate over each highlighted node and generate the corresponding equation
for index = 1:size(highlightedNodes, 1)
    i = highlightedNodes(index, 1);
    j = highlightedNodes(index, 2);
    
    % Adjust yDistance based on the position j
    if j == 1
        deltaY = yDistance(1);
    else
        deltaY = yDistance(2);
    end
    
    % Equation for the node at position (i, j)
    if i == 1
        % Node on the left edge with Dirichlet condition
        fprintf('P7.1 Node(%d,%d) = T(%d,%d) = 100 °C\n', i, j, i, j);
    elseif i == 5
        % % Node on the right edge with convection
        fprintf('P7.1 Node(%d,%d) = %f*(T(%d,%d) - %f) + %f*(T(%d,%d+1) + T(%d,%d-1) + T(%d-1,%d) - 3*T(%d,%d))\n', ...
                i, j, convectionCoefficient*thickness, i, j, ambientTemp, thermalConductivity/(xDistance*yDistance), i, j, i, j, i, j, i, j);
    else
        % % Interior nodes
        fprintf('P7.1 Node(%d,%d) = %f*(T(%d,%d+1) + T(%d,%d-1) + T(%d+1,%d) + T(%d-1,%d) - 4*T(%d,%d))\n', ...
                i, j, thermalConductivity/(xDistance*deltaY), i, j, i, j, i, j, i, j, i, j);
    end
end
% fprintf("P7.1 nodo(0,3) = - 0.29751*T13 + 4*T03 - 0.52893*T02 - 3.17355\n")
% fprintf("P7.1 nodo(2,3) = 4*T23 - 0.70588*T13 - 1.41176*T33 - 1.88235*T22\n")
% fprintf("P7.1 nodo(2,2) = 4*T22 - 0.48*T12 - 0.96*T32 - 1.70667*T21 - 0.85333*T23 - 3015.93\n")
% fprintf("P7.1 nodo(5,3) = 4*T53 - 2.33766*T43 - 1.03896*T52 - 6.23377\n\n\n")
fprintf("\n\n")

%%
% Material properties
convectionCoefficient = 0.015; % convection coefficient [cal/(cm^2*ºC*s)]
plateThickness = 1.5; % plate thickness [cm]
ambientTemperature = 10; % ambient temperature [ºC] (assuming it remains the same)

% Mesh dimensions
xSpacing = 40; % distance in x [cm]
ySpacing = [30, 15]; % distance in y [cm] for different segments

% Definition of highlighted nodes (assuming a layout similar to Figure 1)
highlightedNodes = [1 1; 2 1; 3 1; 4 1];

% Assuming a predefined array of temperatures, T, for all nodes
% T = zeros(5, 4); % Example, adjust according to mesh dimensions and initial conditions

% Iterate over each highlighted node and generate the corresponding equation
for index = 1:size(highlightedNodes, 1)
    i = highlightedNodes(index, 1);
    j = highlightedNodes(index, 2);
    
    % Adjust ySpacing based on the position j
    if j == 1
        deltaY = ySpacing(1);
    else
        deltaY = ySpacing(2);
    end
    
    % Equation for the node at position (i, j)
    if i == 1
        % Node on the left edge with Dirichlet condition
        fprintf('P7.2 Node(%d,%d) = T(%d,%d) = 100 °C\n', i, j, i, j);
    elseif i == 5
        % Node on the right edge with convection
        fprintf('P7.2 Node(%d,%d) = %f*(T(%d,%d) - %f) + %f*(T(%d,%d+1) + T(%d,%d-1) + T(%d-1,%d) - 3*T(%d,%d))\n', ...
                i, j, convectionCoefficient*plateThickness, i, j, ambientTemperature, thermalConductivity/(xSpacing*ySpacing), i, j, i, j, i, j, i, j);
    else
        % Interior nodes
        fprintf('P7.2 Node(%d,%d) = %f*(T(%d,%d+1) + T(%d,%d-1) + T(%d+1,%d) + T(%d-1,%d) - 4*T(%d,%d))\n', ...
                i, j, thermalConductivity/(xSpacing*deltaY), i, j, i, j, i, j, i, j, i, j);
    end
end
% fprintf("P7.2 nodo(0,0) = 4*T00 - 0.46069*T10 - 3.27605*T01 - 5.26508\n")
% fprintf("P7.2 nodo(1,1) = 4*T11 - 0.78755*T21 - 1.77389*T10 - 0.88694*T12 - 0.55142*T01\n")
% fprintf("P7.2 nodo(2,1) = 4*T21 - 1.05882*T11 -  1.2549*T20 - 0.62745*T22 - 4235.29\n")

% clc
% clear all
% 
% node03 = @(T13,T03,T02) (0.5*15*1*(T13-T03)/40 - 0.5*20*1*(T03-T02)/30 + 0.01*20*1*(10-T03));
% 
% node23 = @(T23,T13,T33,T22) (-0.5*15*1*(T23-T13)/40 + 0.5*15*1*(T33-T23)/20 - 0.5*30*1*(T23-T22)/30 + 0.01*30*1*(10-T23));
% 
% node22 = @(T22,T12,T32,T21) (-0.5*22.5*(T22-T12)/40 + 0.5*22.5*(T32-T22)/20 - 0.5*30*(T23-T22)/30 + 10*pi()*7.5*7.5);
% 
% node53 = @(T53,T43,T52) (-0.5*15*(T53-T43)/20 - 0.5*10*(T53-T52)/30 + 0.01*10*(10-T53));
% 
% node00 = @(T00,T10,T01) (0.01*7.5*2*(20-T00) - 0.7*7.5*2*(T10-T00)/40 + 0.7*20*2*(T01-T00)/15);
% 
% node11 = @(T11,T01,T21,T10) (0.7*22.5*2*(T11-T01)/40 + 0.5*22.5*2*(T21-T11)/20 - 0.7*20*2*(T11-T10)/15 - ...
%     0.5*10*2*(T11-T10)/15 + 0.7*20*2*(T12-T11)/30 + 0.5*10*2*(T12-T11)/30);
% 
% node21 = @(T21,T11,T31,T20) (0.5*22.5*2*(T21-T11)/20 + 0.5*22.5*2*(T31-T21)/20 - ...
%     0.5*20*2*(T21-T20)/15 - 0.5*20*2*(T22-T21)/30 + 10*22.5*20);
% 
% 
% % 
% % node00 = @(T00,T01,T10) (0.01*7.5*2*(20-T00) - 0.7*7.5*2*(T10-T00)/40 + 0.7*20*2*(T01-T00)/15);
% % 
% % node03 = @(T02,T03,T13) (0.5*15*1*(T13-T03)/40 - 0.5*20*1*(T03-T02)/30 + 0.01*20*1*(10-T03));
% % 
% % node11 = @(T01,T10,T11,T12,T21) (0.7*22.5*2*(T11-T01)/40 + 0.5*22.5*2*(T21-T11)/20 - 0.7*20*2*(T11-T10)/15 - ...
% %     0.5*10*2*(T11-T10)/15 + 0.7*20*2*(T12-T11)/30 + 0.5*10*2*(T12-T11)/30);
% % 
% % node21 = @(T11,T20,T21,T22,T31) (0.5*22.5*2*(T21-T11)/20 + 0.5*22.5*2*(T31-T21)/20 - ...
% %     0.5*20*2*(T21-T20)/15 - 0.5*20*2*(T22-T21)/30 + 10*22.5*20);
% % 
% % node22 = @(T12,T21,T22,T32) (-0.5*22.5*(T22-T12)/40 + 0.5*22.5*(T32-T22)/20 - 0.5*30*(T23-T22)/30 + 10*pi()*7.5*7.5);
% % 
% % node23 = @(T13,T22,T23,T33) (-0.5*15*1*(T23-T13)/40 + 0.5*15*1*(T33-T23)/20 - 0.5*30*1*(T23-T22)/30 + 0.01*30*1*(10-T23));
% % 
% % node53 = @(T43,T52,T53) (-0.5*15*(T53-T43)/20 - 0.5*10*(T53-T52)/30 + 0.01*10*(10-T53));
% 
% % Definir la función que encapsula el sistema
% systemFunc = @(T) [
%     node00(T(1), T(2), T(3)), % T00, T01, T10
%     node03(T(4), T(5), T(6)), % T02, T03, T13
%     node11(T(2), T(3), T(7), T(8), T(9)), % T01, T10, T11, T12, T21
%     node21(T(7), T(10), T(9), T(11), T(12)), % T11, T20, T21, T22, T31
%     node22(T(8), T(9), T(11), T(13)), % T12, T21, T22, T32
%     node23(T(6), T(11), T(14), T(15)), % T13, T22, T23, T33
%     node53(T(16), T(17), T(18)) % T43, T52, T53
% ];
% 
% % Estimaciones iniciales
% initialGuess = 20 * ones(18,1); % Estimación inicial para todas las temperaturas
% 
% % Usar fsolve para encontrar la solución
% options = optimoptions('fsolve', 'Display', 'iter'); % Muestra el proceso de iteración
% solution = fsolve(systemFunc, initialGuess, options);
% 
% % Mostrar las soluciones
% disp('Las temperaturas en cada nodo son:');
% disp(solution);