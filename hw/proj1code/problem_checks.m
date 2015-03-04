% Run problem_load before calling these tests

% Form a test problem with one edge deleted (from 1-2)
hatA = A;
hatA(1,2) = 0;
hatA(2,1) = 0;
hatd = full(sum(hatA))';
hatD = spdiags(hatd, 0, n, n);
hatDinv = spdiags(1./d, 0, n, n);
hatN = hatD - alpha*hatA;
hatM = hatM .* hatDinv;

% Comment: Forming a dense vector makes sense in this case,
%          since we want the output of the solve to be dense.
e1    = zeros(n,1);
e1(1) = 1;

% Task 1 (this is a freebee now).  Do with both x and hatx.
x     = M\e1;
hatx  = hatM\e1;

% Checks:
% Task 4: compare x to value computed with factorization.
% Task 5: is norm(M+U*C*V' - hatM,1)/norm(hatM,1) small?
% Task 6: is the solution via SMW close to hatx?