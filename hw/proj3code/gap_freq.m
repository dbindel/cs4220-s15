% whz = gap_freq(pgap, u, V)
%
% Compute the lowest natural frequency for the displaced gap-closing actuator.
%
% Inputs:
%   pgap: structure returned by gap_setup
%   u: displacement vector
%   V: voltage
%
function whz = gap_freq(pgap, u, V)

  if nargin < 2
    u = zeros(pgap.ndof,1);
    V = 0;
  end
  [f,G] = gap_force(pgap, u, V);
  J = pgap.K - G;
  M = pgap.M;
  whz = sqrt(min(eig(J,M)))/2/pi;