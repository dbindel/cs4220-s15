
% Find a root of cos(x) estimate between [0,2]
xs = pi/2;
kmax = 10;

% 1: Newton
x = 1;
err_N = [];
for k = 1:kmax
  err_N(end+1) = abs(x-xs);
  x = x+cos(x)/sin(x);
end
err_N

% 2: Fixed point
x = 1;
err_G = [];
for k = 1:kmax
  err_G(end+1) = abs(x-xs);
  x = x+cos(x)/x;
end
err_G

% 3: Bisection
a = 0;  fa = cos(a);
b = 2;  fb = cos(b);
for k = 1:kmax
  x = (b+a)/2;
  err_B(end+1) = abs(x-xs);
  fx = cos(x);
  if fx*fa > 0
    a = x;
    fa = fx;
  else
    b = x;
    fb = fx;
  end
end
err_B

fp = fopen('rev_itercomp.dat', 'w');
fprintf(fp, 'k N G B\n');
fprintf(fp, '%d %g %g %g\n', [1:kmax; err_N; err_G; err_B]);
fclose(fp);
