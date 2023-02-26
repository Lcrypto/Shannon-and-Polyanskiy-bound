function [kappa_one] = tilde_kappa_one(s,eta,theta,sigma,gamma)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
term_1 = (s.^2*theta^2-(1-s).^2*sigma^2)./(2*eta.^2);
term_2 = (theta^2-sigma^2)./(2*eta);
kappa_one = gamma*term_1-term_2+log(theta/sigma);


end