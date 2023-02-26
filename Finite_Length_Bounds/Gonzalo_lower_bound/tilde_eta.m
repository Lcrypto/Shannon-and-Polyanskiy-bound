function [eta] = tilde_eta(s,theta,sigma)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
eta = theta^2*s+sigma^2*(1-s);


end