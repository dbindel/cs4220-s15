%
% Fixed point continuation (controlling voltage)
%

% === Load gap finite element code

pgap = gap_setup('c', 80);

nelt = pgap.nelt;
Ce = pgap.Ce;
M = pgap.M;
K = pgap.K;
N = pgap.N;
wg = pgap.wg;
Itip = pgap.Itip;
ndof = pgap.ndof;

% === Continuation loop

% === Plot V vs tip displacement
