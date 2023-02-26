function [f] = stable_marcumq(a, b, m)
  f = 1-ncx2cdf(b.^2, 2*m, a.^2);