% [f,Ju,JV2] = gap_force(pgap, u, V)
%
% Compute the electrostatic forces and their gradients with respect
% to elements of u for a displacement u and voltage V.
%
% Inputs:
%   pgap: Structure returned by gap_setup
%   u: Displacement vector
%   V: Voltage
%
% Outputs:
%   f: Finite element force vector
%   Ju: Jacobian of f with respect to u
%   JV: Jacobian of f with respect to V^2
%
function [f,Ju,JV] = gap_force(pgap, ur, V)

  nelt = pgap.nelt;
  Ce = pgap.Ce;
  g = pgap.g;
  N  = pgap.N;
  wg = pgap.wg;
  Ir = pgap.Ir;
  nn = 2*(nelt+1);

  % Map reduced dof back to full vector
  u = zeros(nn,1);
  u(Ir) = ur;

  % Main assembly loop (don't worry about voltage yet)
  f = zeros(nn,1);
  Ju = zeros(nn,nn);
  for k = 1:nelt
    I       = 2*(k-1)+(1:4);
    ue      = N*u(I);
    fe      = -(Ce/2) ./ ( (g+ue).^2 );
    dfe     = Ce ./ ( (g+ue).^3 );
    f(I)    = f(I) + N' * (wg .* fe);
    Ju(I,I) = Ju(I,I) + N' * diag(wg .* dfe) * N;
  end

  % Keep part associated with reduced dofs
  f  = f(Ir);
  Ju = Ju(Ir,Ir);

  % Bring in dependence on voltage here
  %JV = (2*V) * f;
  JV = f;
  Ju = V^2 * Ju;
  f = V^2 * f;  