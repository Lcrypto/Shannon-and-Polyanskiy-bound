function [kappa] = tilde_kappa(s,eta,theta,sigma,gamma)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
term_1 = gamma*s.*(s-1)./(2*eta);
term_2 = log(theta.^s.*sigma.^(1-s)./sqrt(eta));
kappa = term_1+term_2;
end