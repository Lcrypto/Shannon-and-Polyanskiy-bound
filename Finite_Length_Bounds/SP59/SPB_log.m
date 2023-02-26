function [Pe] = SPB_log(n,theta,A)
%   log_domatin spb
%  

x_val = 0.01:0.01:100;

%term_1 = (n-2)*log(x_val);
term_0 = (n-1)*exp(-n*A^2/2)/sqrt(2*pi);


F_val = max_star_seq(n,x_val);

%y = @(phi) exp(interp1(x_val,term_1,sin(phi))+interp1(x_val,F_val,sqrt(n)*A*cos(phi)));  

%y = @(phi) exp(interp1(x_val,F_val,sqrt(n)*A*cos(phi)));


y = @(phi) exp( log(n-1)-(n*A^2)/2-1/2*log(2*pi)+(n-2)*log(sin(phi))+max_star_seq(n,sqrt(n)*A*cos(phi)));  


term_2 = integral(y,theta,pi/2);

term_3 = 1/2*erfc((sqrt(n)*A)/sqrt(2));

Pe = term_2+term_3;

end