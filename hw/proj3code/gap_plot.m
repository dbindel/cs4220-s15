% gap_plot(pgap, u)
%
% Plot the displaced gap-closing actuator.
%
% Inputs:
%   pgap: structure returned by gap_setup
%   u: displacement vector
%   scale: flag indicating whether to scale to the full domain (default: false)
%
function gap_plot(pgap, u, scale)

  if nargin < 3, scale = 1; end
  ux = zeros(2*(pgap.nelt+1),1);
  ux(pgap.Ir) = u;
  plot(pgap.xx, pgap.g + ux(1:2:end));
  if scale
    axis([pgap.xx(1), pgap.xx(end), 0, 1]);
  end