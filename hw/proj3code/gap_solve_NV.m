% [u, rnorms] = gap_solve_NV(pgap, u, V, rtol, maxiter)
%
% Attempt to solve the gap equation by Newton's method.
%
% Inputs:
%   pgap: Structure returned by gap_setup
%   u: Initial guess of displacement vector
%   V: Voltage
%   rtol: Residual tolerance for convergence (default: 1e-8)
%   maxiter: Maximum iterations allowed (default: 10)
%
% Outputs:
%   u: Computed displacement vector
%   rnorms: Residual norms at each iteration
%
function [u, rnorms] = gap_solve_NV(pgap, u, V, rtol, maxiter)

  % Assign default tolerances if not specified
  if nargin < 4, rtol = 1e-8;  end
  if nargin < 5, maxiter = 10; end

  % Main iteration
  % TODO

  % If we got here, we didn't converge in time
  warning('Newton iteration did not converge')