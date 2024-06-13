%% Excercise 6.1. 

% Parameters
omega = 1.2; % Relaxation factor
tolerance = 1e-2; % Convergence criterion (1%)
max_iter = 10000; % Maximum number of iterations

% Grid setup
N = 5; % Adjusted for finer resolution (includes boundaries)
T = zeros(N); % Initialize temperature grid

% Updated Boundary conditions
T(1, :) = 220;  % Top boundary set to 220 degrees
T(:, 1) = 15;   % Left boundary set to 15 degrees
T(:, N) = 50;   % Right boundary set to 50 degrees
T(N, :) = 0;    % Bottom boundary set to 0 degrees

% Handling corners specifically2
T(1, 1) = (T(1, 2) + T(2, 1)) / 2;  % Average of neighboring boundary points
T(1, N) = (T(1, N-1) + T(2, N)) / 2;  % Top right corner
T(N, 1) = (T(N-1, 1) + T(N, 2)) / 2;  % Bottom left corner
T(N, N) = (T(N-1, N) + T(N, N-1)) / 2;  % Bottom right corner

% Iterative solver using Gauss-Seidel method
for iteration = 1:max_iter
    max_change = 0;
    for i = 2:N-1
        for j = 2:N-1
            old_T = T(i, j);
            % Simple average of the neighboring points
            new_T = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            % Applying relaxation factor
            T(i, j) = (1 - omega) * old_T + omega * new_T;
            % Track the maximum change
            max_change = max(max_change, abs(T(i, j) - old_T));
        end
    end
    
    % Check for convergence
    if max_change < tolerance
        fprintf('Convergence achieved after %d iterations.\n', iteration);
        break;
    end
end

% Display the final temperature distribution
disp(T);

% Plot the temperature distribution
figure; % Create a new figure window
contourf(T, 20, 'LineColor', 'none'); % Create a filled contour plot with 20 levels
colorbar; % Add a color bar to indicate the temperature scale
caxis([0 220]); % Set color axis scaling to include the boundary condition temperatures
title('Temperature Distribution on the Plate');
xlabel('X Dimension');
ylabel('Y Dimension');


%% Exercise 6.2
% Parameters
omega = 1.2; % Relaxation factor
tolerance = 1e-2; % Convergence criterion (1%)
max_iter = 10000; % Maximum number of iterations

% Grid setup
N = 9; % Grid size, assuming a 9x9 grid including boundaries
delta_x = 0.05; % Grid spacing in meters (5 cm)
delta_y = 0.05; % Grid spacing in meters (5 cm)
T = zeros(N); % Initialize temperature grid

% Boundary conditions for Exercise 6.2
T(1, :) = 220;  % Top boundary set to 220 degrees
T(:, 1) = 15;   % Left boundary set to 15 degrees
T(:, N) = 50;   % Right boundary set to 50 degrees
T(N, :) = 0;    % Bottom boundary set to 0 degrees

% Iterative solver using Gauss-Seidel method with relaxation
for iteration = 1:max_iter
    max_change = 0;
    for i = 2:N-1
        for j = 2:N-1
            old_T = T(i, j);
            new_T = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            T(i, j) = (1 - omega) * old_T + omega * new_T;
            max_change = max(max_change, abs(T(i, j) - old_T));
        end
    end
    
    if max_change < tolerance
        fprintf('Convergence achieved after %d iterations.\n', iteration);
        break;
    end
end

% Display the final temperature distribution
disp(T);

% Plot the temperature distribution
figure; % Create a new figure window
contourf(T, 20, 'LineColor', 'none'); % Create a filled contour plot with 20 levels
colorbar; % Add a color bar to indicate the temperature scale
caxis([0 220]); % Set color axis scaling to include the boundary condition temperatures
title('Temperature Distribution on the Plate');
xlabel('X Dimension');
ylabel('Y Dimension');


%% Exercise 6.3 

% Parameters
omega = 1.2; % Relaxation factor
tolerance = 1e-2; % Convergence criterion (1%)
max_iter = 10000; % Maximum number of iterations
k = 1; % Thermal conductivity (adjust based on your material)

% Grid setup
N = 9; % Adjusted for finer resolution (includes boundaries)
delta_x = 0.05; % Grid spacing in meters (assuming 5 cm as before)
delta_y = 0.05; % Grid spacing in meters (assuming 5 cm as before)
T = zeros(N); % Initialize temperature grid

% Updated Boundary conditions for Exercise 6.2
T(1, :) = 220;  % Top boundary set to 220 degrees
T(:, 1) = 15;   % Left boundary set to 15 degrees
T(:, N) = 50;   % Right boundary set to 50 degrees
T(N, :) = 0;    % Bottom boundary set to 0 degrees

% Iterative solver using Gauss-Seidel method
for iteration = 1:max_iter
    max_change = 0;
    for i = 2:N-1
        for j = 2:N-1
            old_T = T(i, j);
            new_T = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            T(i, j) = (1 - omega) * old_T + omega * new_T;
            max_change = max(max_change, abs(T(i, j) - old_T));
        end
    end
    
    if max_change < tolerance
        fprintf('Convergence achieved after %d iterations.\n', iteration);
        break;
    end
end

% Calculate gradients and heat flux
grad_x = zeros(N-2, N-2);
grad_y = zeros(N-2, N-2);
q_x = zeros(N-2, N-2);
q_y = zeros(N-2, N-2);

for i = 2:N-1
    for j = 2:N-1
        grad_x(i-1, j-1) = (T(i+1, j) - T(i-1, j)) / (2 * delta_x);
        grad_y(i-1, j-1) = (T(i, j+1) - T(i, j-1)) / (2 * delta_y);
        q_x(i-1, j-1) = -k * grad_x(i-1, j-1);
        q_y(i-1, j-1) = -k * grad_y(i-1, j-1);
    end
end

% Display results
disp('Heat flux in x-direction (q_x):');
disp(q_x);
disp('Heat flux in y-direction (q_y):');
disp(q_y);

% Optional: Plotting heat flux vectors
figure;
quiver(q_x, q_y);
title('Heat Flux Vectors');
xlabel('X Dimension');
ylabel('Y Dimension');
colorbar; % Adds a color scale for vector magnitude if needed


%% Exercise 6.4 

% Parameters
omega = 1.2; % Relaxation factor
tolerance = 1e-2; % Convergence criterion (1%)
max_iter = 10000; % Maximum number of iterations

% Grid setup
N = 9; % Adjusted for finer resolution (includes boundaries)
T = zeros(N); % Initialize temperature grid

% Updated Boundary conditions for Exercise 6.4
T(1, :) = 220;  % Top boundary set to 220 degrees
T(:, 1) = 15;   % Left boundary set to 15 degrees
T(:, N) = 50;   % Right boundary set to 50 degrees
% Insulated bottom boundary
for j = 2:N-1
    T(N, j) = T(N-1, j);  % Set bottom boundary equal to the row just above it
end

% Iterative solver using Gauss-Seidel method
for iteration = 1:max_iter
    max_change = 0;
    for i = 2:N-1
        for j = 2:N-1
            old_T = T(i, j);
            new_T = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            T(i, j) = (1 - omega) * old_T + omega * new_T;
            max_change = max(max_change, abs(T(i, j) - old_T));
        end
    end
    % Update the insulated boundary after each iteration to maintain the condition
    for j = 2:N-1
        T(N, j) = T(N-1, j);
    end
    
    if max_change < tolerance
        fprintf('Convergence achieved after %d iterations.\n', iteration);
        break;
    end
end

% Display the final temperature distribution
disp(T);

% Plot the temperature distribution
figure; % Create a new figure window
contourf(T, 20, 'LineColor', 'none'); % Create a filled contour plot with 20 levels
colorbar; % Add a color bar to indicate the temperature scale
caxis([0 220]); % Set color axis scaling to include the boundary condition temperatures
title('Temperature Distribution on the Plate');
xlabel('X Dimension');
ylabel('Y Dimension');


%% Exercise 6.5

% Parameters
omega = 1.2; % Relaxation factor
tolerance = 1e-2; % Convergence criterion (1%)
max_iter = 10000; % Maximum number of iterations
k = 1; % Thermal conductivity (adjust based on your material)

% Grid setup
N = 7; % Adjusted for 5 points with boundary nodes (5 interior + 2 boundary)
delta_x = 0.05; % Grid spacing in meters (assuming 5 cm as before)
delta_y = 0.05; % Grid spacing in meters (assuming 5 cm as before)
T = zeros(N); % Initialize temperature grid

% Specified temperatures at the top and right boundaries
T(1, :) = [0, 12.5, 25, 37.5, 50, 37.5, 25];  % Top boundary from left to right
T(:, N) = [0, 12.5, 25, 37.5, 50, 37.5, 25]'; % Right boundary from top to bottom

% Insulated left and bottom boundaries
for j = 2:N-1
    T(N, j) = T(N-1, j); % Insulated bottom boundary
    T(j, 1) = T(j, 2);   % Insulated left boundary
end

% Iterative solver using Gauss-Seidel method
for iteration = 1:max_iter
    max_change = 0;
    for i = 2:N-1
        for j = 2:N-1
            old_T = T(i, j);
            new_T = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            T(i, j) = (1 - omega) * old_T + omega * new_T;
            max_change = max(max_change, abs(T(i, j) - old_T));
        end
    end
    
    % Reapply insulated boundary conditions after each iteration
    for j = 2:N-1
        T(N, j) = T(N-1, j);
        T(j, 1) = T(j, 2);
    end
    
    if max_change < tolerance
        fprintf('Convergence achieved after %d iterations.\n', iteration);
        break;
    end
end

% Calculate gradients and heat flux
grad_x = zeros(N-2, N-2);
grad_y = zeros(N-2, N-2);
q_x = zeros(N-2, N-2);
q_y = zeros(N-2, N-2);

for i = 2:N-1
    for j = 2:N-1
        grad_x(i-1, j-1) = (T(i+1, j) - T(i-1, j)) / (2 * delta_x);
        grad_y(i-1, j-1) = (T(i, j+1) - T(i, j-1)) / (2 * delta_y);
        q_x(i-1, j-1) = -k * grad_x(i-1, j-1);
        q_y(i-1, j-1) = -k * grad_y(i-1, j-1);
    end
end

% Display results and plot
disp('Temperature Distribution:');
disp(T);
disp('Heat flux in x-direction (q_x):');
disp(q_x);
disp('Heat flux in y-direction (q_y):');
disp(q_y);

figure; % Create a new figure window
subplot(1, 2, 1);
contourf(T, 20, 'LineColor', 'none'); % Temperature distribution
title('Temperature Distribution on the Plate');
colorbar;
subplot(1, 2, 2);
quiver(q_x, q_y); % Heat flux vectors
title('Heat Flux Vectors');
colorbar;
