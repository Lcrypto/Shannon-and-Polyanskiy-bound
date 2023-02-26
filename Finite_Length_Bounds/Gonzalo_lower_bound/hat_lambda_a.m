function [y] = hat_lambda_a(s,n,kappa_two)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
y=abs(1-s).*sqrt(n*kappa_two);
end