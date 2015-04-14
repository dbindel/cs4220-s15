% [pgap] = gap_setup(bc, nelt, l, h, g)
% 
% Set up a finite element calculation of the deflection of a beam
% forced by an electrostatic gap.
%
% Inputs:
%   bc: string describing boundary conditions; default to cantilever
%       'ff' = fixed-fixed or 'c' = cantilever
%   nelt: number of beam elements; default is 80
%   l: length of the beam (in microns); default is 100
%   h: thickness of the beam (in microns); default is 1
%   g: gap distance (in microns); default is 1
%
% Outputs:
%   pgap: Structure containing information about the finite element mesh
%     .nelt: Number of elements
%     .xx:   Mesh points
%     .Ce:   Capacitance per unit length at one micron gap
%     .g:    Gap size
%     .M:    Mass matrix
%     .K:    Stiffness matrix (mechanical part only)
%     .N:    Shape functions
%     .wg:   scaled Gauss quadrature weights
%     .Ir:   indices of active degrees of freedom (reduced variable set)
%     .Itip: index of cantilever tip displacement (cantilever BC only)
%
function pgap = gap_setup(bc, nelt, l, h, g)

  % === Boundary condition type (fix-fix or cantilever)

  if nargin < 1, bc = 'c'; end
  
  % === Geometric and physical constants (scaled to micron units)

  if nargin < 2, nelt = 80; end   % Number of elements
  if nargin < 3, l = 100;   end   % Beam length (um)
  if nargin < 4, h = 1;     end   % Beam thickness (um)
  if nargin < 5, g = 1;     end   % Gap (um)
  b = 5;                          % Beam width (um)

  I = b*h^3/12;      % Moment of inertia (um^4)
  A = b*h;           % Cross-sectional area (um^2)

  E = 165e3;         % Young's modulus for silicon (kg/um/s^2)
  rho = 2330e-18;    % Density of silicon (kg / um^3)
  eps0 = 8.854e-6;   % Permittivity of free space (scaled for microns + volts)

  Ce = eps0 * b;     % Capacitance per unit length at unit distance

  % === Gauss quadrature nodes and weights

  xgauss = [-8.61136311594053e-01
            -3.39981043584856e-01,
             3.39981043584856e-01,
             8.61136311594053e-01];
  wgauss = [ 3.47854845137454e-01;
             6.52145154862546e-01;
             6.52145154862546e-01;
             3.47854845137454e-01];

  % === Mass and stiffness assembly

  he = l/nelt;  % Length each element

  % Shape functions at Gauss nodes
  N = [   (1-xgauss).^2 .* (2+xgauss) / 4, ...
       he*(1-xgauss).^2 .* (1+xgauss) / 8, ...
          (1+xgauss).^2 .* (2-xgauss) / 4, ...
       he*(1+xgauss).^2 .* (xgauss-1) / 8];

  % Gauss quadrature weights
  wg = wgauss*he/2;

  % Element stiffness
  Ke = 2*E*I/he^3 * [ 6,   -3*he,  -6,   -3*he;
                     -3*he, 2*he^2, 3*he, he^2;
                     -6,    3*he,   6,    3*he;
                     -3*he, he^2,   3*he, 2*he^2];

  % Element mass
  Me = rho*A * (N'*diag(wg)*N);

  % Element load at zero displacement and unit voltage
  f0e = -Ce/2/g^2 * (N' * wg);

  nn = 2*(nelt+1);   % Number of element degrees of freedom (unreduced)
  K = zeros(nn,nn);  % Unreduced global stiffness
  M = zeros(nn,nn);  % Unreduced global mass
  f0 = zeros(nn,1);  % Load profile for use at small displacements

  % Mass + stiffness + basic load profile assembly loop
  for k = 1:nelt
    I = 2*(k-1)+(1:4);
    K(I,I) = K(I,I) + Ke;
    M(I,I) = M(I,I) + Me;
    f0(I) = f0(I) + f0e;
  end

  % === Construct indices of active dofs

  nn = 2*(nelt+1);
  if strcmp(bc, 'ff')
    Ir = 3:nn-2;
  else
    Ir = 3:nn;
  end  
  
  % === Save results in a structure

  pgap = [];
  pgap.nelt = nelt;
  pgap.xx = linspace(0,l,nelt+1);
  pgap.Ce = Ce;
  pgap.g = g;
  pgap.M = M(Ir,Ir);
  pgap.K = K(Ir,Ir);
  pgap.f0 = f0(Ir);
  
  pgap.N = N;
  pgap.wg = wg;
  pgap.Ir = Ir;
  pgap.ndof = length(pgap.Ir);
  if strcmp(bc, 'c')
    pgap.Itip = find(pgap.Ir == nn-1);
  end
