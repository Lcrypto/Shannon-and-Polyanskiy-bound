function [y] = hat_lambda_b(s,n,kappa_two)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
y=abs(s).*sqrt(n*kappa_two);
end