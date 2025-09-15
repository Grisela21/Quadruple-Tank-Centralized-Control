% Given values
Di = 4.445e-2;
d0 = 0.445e-2;
d1 = 0.55563e-2;
k0 = 3.9e-6;
k1 = 4.15e-6;
gamma = 0.61;
g = 9.8;
v1 = 9.5;

% Cross-sectional areas and outlet hole areas for each tank i
A0 = pi * (Di / 2)^2;
A1 = pi * (Di / 2)^2;
A2 = pi * (Di / 2)^2;
A3 = pi * (Di / 2)^2;

a0 = pi * (d0 / 2)^2;
a1 = pi * (d1 / 2)^2;
a2 = pi * (d0 / 2)^2;
a3 = pi * (d1 / 2)^2;

% Initial heights (assuming h0 = h1 = h2 = h3 = 0)
initial_heights = [0; 0; 0; 0];

% Function to define the system of equations
equations = @(h) [
    -((a0 / A0) * sqrt(2 * g * h(1))) + (gamma * k1 / A0 * v1);
    -((a1 / A1) * sqrt(2 * g * h(2))) + ((a0 / A1) * sqrt(2 * g * h(1))) + ((1 - gamma) * k0 / A1 * v1);
    -((a2 / A2) * sqrt(2 * g * h(3))) + (gamma * k0 / A2 * v1);
    -((a3 / A3) * sqrt(2 * g * h(4))) + ((a2 / A3) * sqrt(2 * g * h(3))) + ((1 - gamma) * k1 / A3 * v1);
];

% Solve the system of equations
options = optimset('Display', 'iter');  % optional, for displaying the iteration steps
result = fsolve(equations, initial_heights, options);

% Display the result
disp('Result:');
disp(result);
