clear all
clc

function y = AFyt(x, t, c)
    % input: 
    %     x: x coordinate of center line, float
    %     t: maximum thickness, in fraction of chord length, float
    %     c: chord length, float
    % output:
    %     half thickness of airfoil at corresponding x coordinate
    y = 5. * t * (0.2969 * (sqrt(x/c)) - ...
                 0.126 * (x/c) - ...
                 0.3516 * ((x/c).^2) + ...
                 0.2843 * ((x/c).^3) - ...
                 0.1036 * ((x/c).^4));
end

x = linspace(0., 1., 101);
plot(x, AFyt(x, 0.14, 1.0), 'k-', 'LineWidth', 2);    % upper surface
hold on;
plot(x, -AFyt(x, 0.14, 1.0), 'k-', 'LineWidth', 2);  % lower surface
axis equal; ylim([-0.5, 0.5]);

%%

function y = AFyc(x, m, p, c)
    % input:
    %     x: x coordinate of center line, float
    %     m: the maximum camber (100 m is the first of the four digits), float
    %     p: location of maximum camber (10 p is the second digit), float
    %     c: chord length, float
    % output:
    %     y coordinate of center line at corresponding x coordinate

    for idx = 1:length(x)
    
    % Check conditions and compute theta
    if (x(idx) >= 0.0) && (x(idx) <= p * c)
        theta(idx) = atan(2.0 * m * (p - (x / c)) / (p^2));
    elseif (x(idx) > p * c) && (x(idx) <= c)
        theta(idx) = atan(2.0 * m * (p - (x(idx) / c)) / ((1 - p)^2));
    else
        error('Invalid x coordinate');
    end
end

end

function theta = AFth(x, m, p, c)
    % input:
    %     x: x coordinate of center line, array
    %     m: the maximum camber (100 m is the first of the four digits), float
    %     p: location of maximum camber (10 p is the second digit), float
    %     c: chord length, float
    % output:
    %     angle between center and horizontal line at corresponding x coordinate

    theta = zeros(size(x));  % Preallocate theta to match the size of x

    for i = 1:length(x)
        if (x(i) >= 0.0) && (x(i) <= p*c)
            theta(i) = atan(2.0 * m * (p - (x(i)/c)) / (p^2));
        elseif (x(i) > p*c) && (x(i) <= c)
            theta(i) = atan(2.0 * m * (p - (x(i)/c)) / ((1. - p)^2));
        else
            error('Invalid x coordinate: %f', x(i));
        end
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
    if (m == 0.) || (p == 0)
        x = x;
        y = sign * AFyt(x, t, c);
    else
        x = x - sign * AFyt(x, t, c) * sin(AFth(x, m, p, c));
        y = AFyc(x, m, p, c) + sign * AFyt(x, t, c) * cos(AFth(x, m, p, c));
    end
end

x = linspace(0., 1., 101);
[xU, yU] = AF(x, 0.12, 1, 0.02, 0.4, 1.0);
[xL, yL] = AF(x, 0.12, -1, 0.02, 0.4, 1.0);
plot(xU, yU, 'k-', 'LineWidth', 2);
plot(xL, yL, 'k-', 'LineWidth', 2);
axis equal; ylim([-0.5, 0.5]);