function [Pe] = SPB(n,theta,A)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

term_1 = (n-1)*exp(-n*A^2/2)/sqrt(2*pi);

x_val = 0:0.01:100;
F_val = F(n,x_val);

y = @(phi) (sin(phi).^(n-2)).*interp1(x_val,F_val,sqrt(n)*A*cos(phi));

term_2 = integral(y,theta,pi/2);

term_3 = 1/2*erfc((sqrt(n)*A)/sqrt(2));

Pe = term_1*term_2+term_3;

end