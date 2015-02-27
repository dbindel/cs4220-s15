load('roadNet-CA.mat');

alpha = 0.9;
A = Problem.A;
n = length(A);
d = full(sum(A))';
I = find(d);

n = length(I);
d = d(I);
A = A(I,I);
D = spdiags(d, 0, n, n);
Dinv = spdiags(1./d, 0, n, n);
T = A * Dinv;

N = D-alpha*A;
M = speye(n) - alpha*T;