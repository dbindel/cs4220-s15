% Solve g(x) = 0 via Newton's iteration (see notes)

g = @(x) (x+1)^(1/8)*(x-1)-0.1;
gp = @(x) (x+1)^(-7/8)*(x-1)/8 + (x+1)^(1/8);

fp = fopen('newtong.dat', 'w');
fprintf(fp, 'k g dx\n');

x = 1;
for k = 1:8
  gx = g(x);
  dx = gx/gp(x);
  fprintf(fp, '%d %e %e\n', k, abs(gx), abs(dx));
  x = x-dx;
end

fclose(fp);