% [u, V, rnorms] = gap_solve_Nd(pgap, u, V, d, rtol, maxiter)
%
% Attempt to solve the gap equation by Newton's method.  Applies
% displacement control to the tip.
%
% Inputs:
%   pgap: Structure returned by gap_setup
%   u: Initial guess of displacement vector
%   V: Initial guess of voltage
%   d: Tip displacement
%   rtol: Residual tolerance for convergence (default: 1e-8)
%   maxiter: Maximum iterations allowed (default: 5)
%
% Outputs:
%   u: Computed displacement vector
%   V: Computed voltage level
%   rnorms: Residual norms at each iteration
%
function [u, V, rnorms] = gap_solve_Nd(pgap, u, V, d, rtol, maxiter)

  % Assign default tolerances if not specified
  if nargin < 5, rtol = 1e-8;  end
  if nargin < 6, maxiter = 10; end

  % Main iteration (TODO)
  
  % If we got here, we didn't converge in time
  warning('Newton iteration did not converge')