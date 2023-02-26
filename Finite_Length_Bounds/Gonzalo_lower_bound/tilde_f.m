function [y] = tilde_f(s,theta,sigma,gamma,beta,n)
%UNTITLED22 Summary of this function goes here
%   Detailed explanation goes here
eta=tilde_eta(s,theta,sigma);
kappa = tilde_kappa(s,eta,theta,sigma,gamma);
kappa_one = tilde_kappa_one(s,eta,theta,sigma,gamma);
kappa_two = tilde_kappa_two(s,eta,theta,sigma,gamma);
lambda_a = hat_lambda_a(s,n,kappa_two);
lambda_b = hat_lambda_b(s,n,kappa_two);
a = hat_a(s,lambda_a);
b = hat_b(s,lambda_b);

term_1 = (a+b).*exp(n*(kappa+(1-s).*kappa_one));
term_2 = indicator_greater_1(s);
term_3 = (indicator_less_0(s)-beta).*exp(n*kappa_one);


y=term_1+term_2+term_3;
end