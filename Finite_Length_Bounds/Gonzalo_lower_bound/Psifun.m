function [y] = Psifun(lambda)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
y=qfunc(abs(lambda)).*exp(lambda.^2/2);
end