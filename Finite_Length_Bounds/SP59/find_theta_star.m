function theta_star = find_theta_star(n,R)
%----------------------------------------------------------------------
%  theta_star = find_theta_start(n,R)
% This function caculate approximated theta_1, i.e. theta_star. The
% euqation is from the following paper: 
%
% A. Valembois and M. P. C. Fossorier, "Sphere-packing bounds 
% revisited for moderate block lengths," in IEEE Transactions 
% on Information Theory, vol. 50, no. 12, pp. 2998-3014, Dec. 
% 2004, doi: 10.1109/TIT.2004.838090.
%
% Input:    n               --      blocklength
%           R               --      rate
% Output:   theta_star      --      approximated theta_1
%------------------------------------------------------------------------

 y = @(theta) (gamma(n/2)*(sin(theta).^(n-1)))...
        ./(2*gamma((n+1)/2)*sqrt(pi)*cos(theta)).*(1-(tan(theta).^2)/n); 
    
 angles = 0.01:0.01:pi/2-0.01;
 values = y(angles);
 
 %%remove unique values
 [C,ia,~]=unique(values,"stable");
 values =C;
 angles = angles(ia);

theta_star = interp1(values,angles, 2^(-n*R));
 
% plot(angles,values);

end