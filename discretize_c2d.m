% Define your continuous-time system matrices A and B
clc
clear
A = [-0.0635       0        0           0; 
      0.0635 -0.0965        0           0;
           0       0  -0.0965           0;
           0       0   0.0676      -0.0978 ]
B = [0      0.0016;
     0.0010 0;
     0.0015 0;
     0      0.0010 ]

% Specify the time sample Ts
Ts = 0.1;  % Replace with your desired time sample

% Use c2d to discretize the system
[A_d, B_d] = c2d(A, B, Ts);

% Display the discretized matrices
disp('Discretized System Matrices:')
disp('A_d:')
disp(A_d)
disp('B_d:')
disp(B_d)
