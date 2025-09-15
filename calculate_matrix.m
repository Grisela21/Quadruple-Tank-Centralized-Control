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

h0=0.1220;
h1=0.1286;
h2=0.1077;
h3=0.1252;


% Equations
m1 =-a0/A0 * g/(sqrt(2)*sqrt(g*h0));
m2 = a0/A1 * g/(sqrt(2)*sqrt(g*h0));
m22=-a1/A1 * g/(sqrt(2)*sqrt(g*h1));
m3 =-a2/A2 * g/(sqrt(2)*sqrt(g*h2));
m4 = a2/A3 * g/(sqrt(2)*sqrt(g*h2));
m42=-a3/A3 * g/(sqrt(2)*sqrt(g*h3));

b1=(k1*gamma)/A0;
b2=(-k0*(gamma-1))/A1;
b3=(k0*gamma)/A2;
b4=(-k1*(gamma-1))/A3;

y1= (((9.5*gamma*k1)/a0)^2)/(2*g);
y2= (((a0*sqrt(2*g*y1) ...
    +9.5*(1-gamma)*k0)/a1)^2)/(2*g);

y3= (((9.5*gamma*k0)/a2)^2)/(2*g);
y4= (((a2*sqrt(2*g*y3) ...
    +9.5*(1-gamma)*k1)/a3)^2)/(2*g);

% Display results
disp('Matrix A (m1,m2,m22,m3,m4,m42):');
disp([m1,m2,m22,m3,m4,m42]);

disp('Matrix B (b1,b2,b3,b4):');
disp([b1,b2,b3,b4]);
disp(y1);
disp(y2);
disp(y3);
disp(y4);
