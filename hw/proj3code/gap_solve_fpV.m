% [u, rnorms] = gap_solve_fpV(pgap, u, V, rtol, maxiter)
%
% Attempt to solve the gap equation by a fixed point iteration.
%
% Inputs:
%   pgap: Structure returned by gap_setup
%   u: Initial guess of displacement vector
%   V: Voltage
%   rtol: Residual tolerance for convergence (default: 1e-8)
%   maxiter: Maximum iterations allowed (default: 20)
%
% Outputs:
%   u: Computed displacement vector
%   rnorms: Residual norms at each iteration
%
function [u, rnorms] = gap_solve_fpV(pgap, u, V, rtol, maxiter)

  % Assign default tolerances if not specified
  if nargin < 4, rtol = 1e-8;  end
  if nargin < 5, maxiter = 20; end

  % Main iteration
  K = pgap.K;
  [L,U] = lu(K);
  rnorms = zeros(maxiter,1);
  for iter = 1:maxiter
    f = gap_force(pgap, u, V);
    rnorms(iter) = norm(K*u-f);
    if rnorms(iter) < rtol
      rnorms = rnorms(1:iter);
      return;
    end
    u = U\(L\f);
  end

  % If we got here, we didn't converge in time
  warning('Fixed point iteration did not converge')