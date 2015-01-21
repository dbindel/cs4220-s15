function x = reciprocal_newton(x, d, n)
  % Approximate x = 1/d by n steps of Newton

  for k = 1:n
    x = x*(2-d*x);
  end
