function [theta2] = tilde_theat_s(gamma,sigma,R)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

a_1 = (exp(2*R)-1)/2;
a_2 = sqrt(1+(4*sigma^2*exp(2*R))/(gamma*(exp(2*R)-1)));
s=a_1*(a_2-1);
theta2 = sigma^2+gamma/2-sigma^2/(2*s)+sqrt(gamma*sigma^2+(gamma/2-sigma^2/(2*s))^2);

end