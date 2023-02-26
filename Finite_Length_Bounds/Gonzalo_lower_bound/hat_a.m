function [y] = hat_a(s,tilde_lambda_a_s)
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here
y=sign_lf(1-s).*Psifun(tilde_lambda_a_s);
end