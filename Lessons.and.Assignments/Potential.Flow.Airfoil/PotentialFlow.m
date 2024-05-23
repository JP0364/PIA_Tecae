%% Potential Flow Model for Predator-Prey System

% Plot airfoil with thickness 14
x = linspace(0, 1, 101);
plot(x, AFyt(x, 0.14, 1.0), 'k-', 'LineWidth', 2);    % upper surface
hold on;
plot(x, -AFyt(x, 0.14, 1.0), 'k-', 'LineWidth', 2);  % lower surface
axis equal; ylim([-0.5, 0.5]);

% Plot airfoil with camber 4
function y = AFyt(x, t, c)
    % input: 
    %     x: x coordinate of center line, float
    %     t: maximum thickness, in fraction of chord length, float
    %     c: chord length, float
    % output:
    %     half thickness of airfoil at corresponding x coordinate
    
    y = 5 * t * (0.2969 * ((x/c).^0.5) - ...
                 0.126 * (x/c) - ...
                 0.3516 * ((x/c).^2) + ...
                 0.2843 * ((x/c).^3) - ...
                 0.1036 * ((x/c).^4));
end



%% Plot airfoil with thickness 14 and camber 4


[xU, yU] = AF(x, 0.12, 1, 0.02, 0.4, 1.0);
[xL, yL] = AF(x, 0.12, -1, 0.02, 0.4, 1.0);
plot(xU, yU, 'k-', 'LineWidth', 2);
hold on;
plot(xL, yL, 'k-', 'LineWidth', 2);
axis equal; ylim([-0.5, 0.5]);


function y = AFyc(x, m, p, c)
    % input:
    %     x: x coordinate of center line, float
    %     m: the maximum camber (100 m is the first of the four digits), float
    %     p: location of maximum camber (10 p is the second digit), float
    %     c: chord lrngth, float
    % output:
    %     y coordinate of center line at corresponding x coordinate
    
    if (x >= 0.0) && (x <= p*c)
        y = m * x * (2 * p - (x/c)) / (p^2);
    elseif (x > p*c) && (x <= c)
        y = m * (c - x) * (1 + (x/c) - 2 * p) / ((1 - p)^2);
    else
        error('ValueError');
    end
end

% Plot airfoil with thickness 14 and camber 4
function theta = AFth(x, m, p, c)
    % input:
    %     x: x coordinate of center line, float
    %     m: the maximum camber (100 m is the first of the four digits), float
    %     p: location of maximum camber (10 p is the second digit), float
    %     c: chord length, float
    % output:
    %     angle between center and horizontal line at corresponding x coordinate
    
    if (x >= 0.0) && (x <= p*c)
        theta = atan(2.0 * m * (p - (x/c)) / (p^2));
    elseif (x > p*c) && (x <= c)
        theta = atan(2.0 * m * (p - (x/c)) / ((1 - p)^2));
    else
        error('ValueError');
    end
end


function [x, y] = AF(x, t, sign, m, p, c)
    % input:
    %     x: x coordinate of center line, float
    %     t: maximum thickness, in fraction of chord length, float
    %     sign: indicate upper (1) or lower (-1) surface of airfoil
    %     m: the maximum camber (100 m is the first of the four digits), float
    %     p: location of maximum camber (10 p is the second digit), float
    %     c: chord length, float
    % output:
    %     x, y coordinates on airfoil surface at corresponding 
    %     center line x coordinate
    
    if (m == 0) || (p == 0)
        x = x;
        y = sign * AFyt(x, t, c);
    else
        x = x - sign * AFyt(x, t, c) .* sin(AFth(x, m, p, c));
        y = AFyc(x, m, p, c) + sign * AFyt(x, t, c) .* cos(AFth(x, m, p, c));
    end
end
