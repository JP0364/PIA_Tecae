

% Define the equations as global variables
global eq_00 eq_01 eq_02 eq_10 eq_11 eq_12 eq_20 eq_21 eq_22;

% ...

% Assign values to the equations
eq_00 = heat_flow_left_cc - heat_flow_right_cc - heat_flow_upper_cc;
eq_01 = ... % Assign the equation for node 0,1
eq_02 = ... % Assign the equation for node 0,2
eq_10 = ... % Assign the equation for node 1,0
eq_11 = ... % Assign the equation for node 1,1
eq_12 = ... % Assign the equation for node 1,2
eq_20 = ... % Assign the equation for node 2,0
eq_21 = ... % Assign the equation for node 2,1
eq_22 = ... % Assign the equation for node 2,2

% ...

% In the showEquation function, remove the eval function and directly access the global variable
disp(['The equation for node ' num2str(i-1) ',' num2str(j-1) ' is:']);
disp(eval(equation));
