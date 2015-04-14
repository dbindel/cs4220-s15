%
% Demo script (solve for gap)
%
% This script uses a simple fixed-point iteration (not Newton) to
% solve the force balance equation at a single fixed voltage.
%

% === Load gap finite element code

pgap = gap_setup('c', 80);

nelt = pgap.nelt;
Ce = pgap.Ce;
M = pgap.M;
K = pgap.K;
N = pgap.N;
wg = pgap.wg;
ndof = pgap.ndof;

% === Solver loop (fixed point)

V = 6.3;
u = zeros(ndof,1);
[u, rnorms] = gap_solve_fpV(pgap, u, V);

% === Plot results

figure(1);
semilogy(rnorms);
xlabel('k');
ylabel('|f|');
title('Residual error for fixed point iteration');

figure(2);
gap_plot(pgap, u);
title('Cantilever deformation at 6V');