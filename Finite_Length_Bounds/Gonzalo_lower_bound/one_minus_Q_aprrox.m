function [y] = one_minus_Q_aprrox(b,c,a)
%UNTITLED Summary of this function goes here
%   a is m in here
k=0:100;
%t1 = 2.^(-k).*(-c^2).^k.* kummerU(-k,a,-b^2/2)./((a+k).*factorial(k));
%y=2^(-a)*(c^2)^a*exp(-b^2/2)*sum(t1)/gamma(a);
t1 = (-c.^2/2).^k.* laguerreL(k,a-1,b.^2/2);
t2 = gamma(1+a+k);
t3 = sum(t1./t2);
y=2.^(-a)*(c.^2).^a.*exp(-b^2/2)*t3;
end