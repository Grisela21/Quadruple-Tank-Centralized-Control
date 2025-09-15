% Given parameters
Di = 4.445e-2;      % Diameter for all tanks (m)
d0 = 0.445e-2;      % Outlet hole diameter for Tank 0 and Tank 2 (m)
d1 = 0.55563e-2;    % Outlet hole diameter for Tank 1 and Tank 3 (m)
k0 = 3.9e-6;        % Flow constant for Pump 0 (m^3/Vs)
k1 = 4.15e-6;       % Flow constant for Pump 1 (m^3/Vs)
gamma = 0.61;       % Valve setting
g = 9.81;           % Gravitational acceleration (m/s^2)
v0eq=9.5;
v1eq=9.5;
% Tank heights (m)


% Cross-sectional areas of tanks
A0 = pi * ((Di/2)^2);
A1 = pi * ((Di/2)^2);
A2 = pi * ((Di/2)^2);
A3 = pi * ((Di/2)^2);

% Cross-sectional areas of outlet holes
a0 = pi * ((d0/2)^2);
a1 = pi * ((d1/2)^2);
a2 = pi * ((d0/2)^2);
a3 = pi * ((d1/2)^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Control

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [-0.0635       0        0           0; 
      0.0635 -0.0965        0           0;
           0       0  -0.0965           0;
           0       0   0.0676      -0.0978 ]
B = [0      0.0016;
     0.0010 0;
     0.0015 0;
     0      0.0010 ]

A_d=[0.9937         0         0         0
     0.0063    0.9904         0         0
         0         0    0.9904         0
         0         0    0.0067    0.9903]
B_d=1.0e-03 *[
         0    0.1595
    0.0995    0.0005
    0.1493         0
    0.0005    0.0995]

R=eye(2);
R(2,2)=10^2; 
Q=10*eye(4);
Q(1,1)=0.01;
Qxx=A_d'*Q*A_d+Q;
Quu=R+B_d'*Q*B_d;
Qux=B_d'*Q*A_d;
Qxu=Qux';
Quuinv=inv(Quu);
K=-Quuinv*Qux;


h0eq=0.1220;
h1eq= 0.1286;
h2eq=0.1077;
h3eq=0.1252;





