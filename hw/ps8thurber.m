% Source:
%   http://www.itl.nist.gov/div898/strd/nls/data/thurber.shtml
%
xy = [80.574E0      -3.067E0
      84.248E0      -2.981E0
      87.264E0      -2.921E0
      87.195E0      -2.912E0
      89.076E0      -2.840E0
      89.608E0      -2.797E0
      89.868E0      -2.702E0
      90.101E0      -2.699E0
      92.405E0      -2.633E0
      95.854E0      -2.481E0
     100.696E0      -2.363E0
     101.060E0      -2.322E0
     401.672E0      -1.501E0
     390.724E0      -1.460E0
     567.534E0      -1.274E0
     635.316E0      -1.212E0
     733.054E0      -1.100E0
     759.087E0      -1.046E0
     894.206E0      -0.915E0
     990.785E0      -0.714E0
    1090.109E0      -0.566E0
    1080.914E0      -0.545E0
    1122.643E0      -0.400E0
    1178.351E0      -0.309E0
    1260.531E0      -0.109E0
    1273.514E0      -0.103E0
    1288.339E0       0.010E0
    1327.543E0       0.119E0
    1353.863E0       0.377E0
    1414.509E0       0.790E0
    1425.208E0       0.963E0
    1421.384E0       1.006E0
    1442.962E0       1.115E0
    1464.350E0       1.572E0
    1468.705E0       1.841E0
    1447.894E0       2.047E0
    1457.628E0       2.200E0];

% Data points
y = xy(:,1);
x = xy(:,2);

% Mesh for plotting f
xx =linspace(x(1), x(end));

% Initial values
b = [1000;
     1000;
     400;
     40;
     0.7;
     0.3;
     0.03];

% Certified values
bref = [1.2881396800E+03;
        1.4910792535E+03;
        5.8323836877E+02;
        7.5416644291E+01;
        9.6629502864E-01;
        3.9797285797E-01;
        4.9727297349E-02];
     
% Tolerance on norm(J'*r)
rtol = 1e-8;

% Record residual norms
resids = [];

% Evaluate initial residual
n = b(1) + (b(2) + (b(3) + b(4)*x).*x).*x;
d =    1 + (b(5) + (b(6) + b(7)*x).*x).*x;
f = n./d;
r = f-y;

% TODO: Iterate to find b s.t. norm(r)^2 is minimal
%       I recommend Gauss-Newton with line search;
%       you may prefer Levenberg-Marquardt or something fancier.

% Check consistency with reference values
fprintf('Relative error vs ref values\n');
fprintf('%d: %e\n', [1:7; abs((bref-b)./bref)']);

% Plot results
figure(1);
nxx = b(1) + (b(2) + (b(3) + b(4)*xx).*xx).*xx;
dxx =    1 + (b(5) + (b(6) + b(7)*xx).*xx).*xx;
fxx = nxx./dxx;
plot(x, y, '.', xx, fxx);

% Plot convergence
figure(2);
semilogy(resids);