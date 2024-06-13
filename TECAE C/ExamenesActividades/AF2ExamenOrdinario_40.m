                                           %%
% Jesus Antonio Ramirez Alpizar - 2077851   %%
% Tecnicas Computacionales en Aeronautica 1 %%
% Examen Ordinario                          %%
% 31 de mayo de 2024                        %%
%                                           %%

clear all
close all
clc


%% Problem 1

% Problem parameters
n = 5; % Number of nodes in x-direction
m = 5; % Number of nodes in y-direction
delta_x = 1; % Spacing in x-direction
delta_y = 1; % Spacing in y-direction
tolerance = 0.01; % Tolerance for convergence
relaxation_factor = 1.2; % Relaxation factor for Liebmann method
k_prime = 0.492; % Thermal conductivity constant

% Initialize temperature matrix
T = zeros(n, m);

% Set boundary conditions
T(:, 1) = 200; % Left temperature
T(1, :) = 0; % Top temperature
T(:, m) = 100; % Right temperature
T(n, :) = 20; % Bottom temperature

% Perform Liebmann method iterations
max_change = inf;
while max_change > tolerance
    max_change = 0;
    for i = 2:n-1
        for j = 2:m-1
            T_old = T(i, j);
            T_new = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            T(i, j) = T_old + relaxation_factor * (T_new - T_old);
            current_change = abs(T(i, j) - T_old);
            if current_change > max_change
                max_change = current_change;
            end
        end
    end
end

% Calculate heat flow using centered finite differences
qx = zeros(n, m);
qy = zeros(n, m);
qr = zeros(n, m);
theta = zeros(n, m);
for i = 2:n-1
    for j = 2:m-1
        qx(i, j) = -k_prime * (T(i, j+1) - T(i, j-1)) / 2 * delta_x;
        qy(i, j) = -k_prime * (T(i+1, j) - T(i-1, j)) / 2 * delta_y;
        qr(i, j) = sqrt(qx(i, j)^2 + qy(i, j)^2);
        theta(i, j) = atan2d(-qy(i, j), qx(i, j));
    end
end

% Adjust angles to a range of 0 to 360 degrees
theta_adjusted = mod(360 + theta, 360);

% Display results
disp('P1: Temperature Distribution on the Plate:');
disp(T);
disp('P1: Resulting Heat Flow (qr):');
disp(qr);
disp('P1: Flow Path Angles (adjusted):');
disp(theta_adjusted);

% Plot temperature distribution
figure;
imagesc(T);
colorbar;
title('Problem 1: Temperature Distribution');
xlabel('x');
ylabel('y');
axis equal;

% Plot flow paths
[X, Y] = meshgrid(1:m, 1:n);
figure;
quiver(X, Y, qx, qy);
title('Problem 1: Flow Paths');
xlabel('x');
ylabel('y');
axis equal;
set(gca, 'YDir', 'reverse');

center_temperature = T(ceil(n/2), ceil(m/2));
center_heat_transfer = qr(ceil(n/2), ceil(m/2));
center_angle_heat_transfer = theta_adjusted(ceil(n/2), ceil(m/2));

disp('P1: Center Temperature:');
disp(center_temperature);
disp('P1: Center Heat Transfer:');
disp(center_heat_transfer);
disp('P1: Center Angle Heat Transfer:');
disp(center_angle_heat_transfer);


%% Problem 2

% Number of nodes and creation of boundary temperatures
nodes = 9;
t1 = linspace(25, 75, 3);
t2 = linspace(150, 50, 3);
t3 = linspace(0, 200, 5);
t4 = linspace(100, 0, 5);
n = sqrt(nodes);
mesh = zeros(n, n);

% Distance between nodes
delta_x = 1;
delta_y = 1;

% Create the temperature matrix with boundary conditions
mesh1 = [t1', mesh, t2'];
T = [t3; mesh1; t4];

% Parameters of the method
tolerance = 1e-2;
relaxation_factor = 1.2;
maximum_change = inf;

% Thermal conductivity constant
k_prime = 0.492;

% Iterations of the Liebmann method
while maximum_change > tolerance
    maximum_change = 0;
    for i = 2:n+1
        for j = 2:n+1
            old_T = T(i, j);

            T_above = T(i-1, j);
            T_below = T(i+1, j);
            T_right = T(i, j+1);
            T_left = T(i, j-1);

            new_T = (T_above + T_below + T_right + T_left) / 4;
            T(i, j) = old_T + relaxation_factor * (new_T - old_T);

            % Calculate the maximum change
            current_change = abs(T(i, j) - old_T);
            if current_change > maximum_change
                maximum_change = current_change;
            end
        end
    end
end

% Assuming that the matrix T contains the calculated temperatures
[n, m] = size(T);
qx = zeros(n, m);
qy = zeros(n, m);
qr = zeros(n, m); % Matrix for the resulting heat flow
theta = zeros(n, m); % Matrix for the angles

% Calculate the heat flow using centered finite differences
for i = 2:n-1
    for j = 2:m-1
        qx(i, j) = -k_prime * (T(i, j+1) - T(i, j-1)) / 2 * delta_x;
        qy(i, j) = -k_prime * (T(i+1, j) - T(i-1, j)) / 2 * delta_y;
        qr(i, j) = sqrt(qx(i, j)^2 + qy(i, j)^2);  % Calculation of the resulting flow
        theta(i, j) = atan2d(-qy(i, j), qx(i, j));  % Calculation of the angle in degrees
    end
end

% Adjust the angles to a range of 0 to 360 degrees
theta_adjusted = mod(360 + theta, 360);

% Display the final temperature matrix
disp('Problem 2: Temperature Distribution on the Plate:');
disp(' ');
disp(T);

% Heat flow
disp('Problem 2: Resulting Heat Flow (qr):');
disp(qr);

% Display the adjusted angles
disp('Problem 2: Heat Flow Path Angles (adjusted):');
disp(theta_adjusted);

% Plot the temperatures in a color graph
figure;
imagesc(T);
colorbar;
title('Problem 2: Temperature distribution');
xlabel('x');
ylabel('y');
axis equal;

% Visualization of the heat flows using quiver plots
[X, Y] = meshgrid(1:m, 1:n);
figure;
quiver(X, Y, qx, qy);
title('Problem 2: Trajectories');
xlabel('x');
ylabel('y');
axis equal;
set(gca, 'YDir', 'reverse');  % Invert the Y-axis direction to match the temperature graph
axis equal;

center_temperature = T(ceil(n+1)/2, ceil(n+1)/2);
center_heat_transfer = qr(ceil(n+1)/2, ceil(n+1)/2);
center_angle_heat_transfer = theta_adjusted(ceil(n+1)/2, ceil(n+1)/2);

disp('P2: Center Temperature:');
disp(center_temperature);

disp('P2: Center Heat Transfer:');
disp(center_heat_transfer);

disp('P2: Center Angle Heat Transfer:');
disp(center_angle_heat_transfer);
