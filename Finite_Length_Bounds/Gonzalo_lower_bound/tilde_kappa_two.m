function [kappa_two] = tilde_kappa_two(s,eta,theta,sigma,gamma)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
term_1 = gamma*theta^2*sigma^2./(eta.^3);
term_2 = (theta^2-sigma^2)^2./(2*eta.^2);
kappa_two = term_1+term_2;
end