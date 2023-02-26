function [y] = hat_b(s,hat_lambda_b)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
y=sign_lf(s).*Psifun(hat_lambda_b);
end